class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.datetime :data
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
