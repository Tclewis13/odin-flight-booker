class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.integer :departure
      t.integer :arrival
      t.datetime :takeoff
      t.integer :duration

      t.timestamps
    end
  end
end
