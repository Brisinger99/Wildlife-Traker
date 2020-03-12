class AnimalsController < ApplicationController

    def index
        @animals = Animal.all
        render json: @animals
    end

    def show
        @animal = Animal.find([params[:id]])
        @sightings = Sighting.where(animal_id: params[:id])
        @all = []
        @all << @animal << @sightings
        render json: (@all)
    end

    def create
        @animal = Animal.create(animals_params)
        if @animal.valid?
            render json: @animal
        else
            render json: @animal.errors
        end
    end

    def destroy
        @animal = Animal.find(params[:id])
     if @animal.destroy
       render json: @animal
     else
       render json: @animal.errors
     end
    end

    def update
        @animal = Animal.find(params[:id])
        if @animal.update(animals_params)
        render json: @animal
      else
        render json: @animal.errors
      end
    end

    private
    def animals_params
        params.require(:animal).permit(:strings, :CommonName, :LatinName, :Kingdom)
    end
end
