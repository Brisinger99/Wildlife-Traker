class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :CommonName
      t.string :LatinName
      t.string :Kingdom

      t.timestamps
    end
  end
end
