class SightingsController < ApplicationController


    def index
        @sightings = Sighting.all
        render json: @sightings
    end

    def show
        @sighting = Sighting.find([params[:id]])
        render json: @sighting
    end

    def destroy
        @sighting = Sighting.find(params[:id])
     if @sighting.destroy
       render json: @sighting
     else
       render json: @sighting.errors
     end
    end

    def update
        @sighting = Sighting.find(params[:id])
        if @sighting.update(sightings_params)
        render json: @sighting
      else
        render json: @sighting.errors
      end
    end



    def create
        @sighting = Sighting.create(sightings_params)
        if @sighting.valid?
            render json: @sighting
        else
            render json: @sighting.errors
        end
    end

    private
    def sightings_params
        params.require(:sighting).permit(:datetime, :data, :floats, :latitude, :longitude, :integer, :animal_id, :start_date, :end_date)
    end
end
