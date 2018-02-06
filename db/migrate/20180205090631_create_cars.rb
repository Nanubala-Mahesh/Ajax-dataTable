class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.datetime :year
      t.string :color

      t.timestamps
    end
  end
end
