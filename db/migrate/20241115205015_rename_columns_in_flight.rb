class RenameColumnsInFlight < ActiveRecord::Migration[7.2]
  def change
    rename_column :flights, :departure, :departure_id
    rename_column :flights, :arrival, :arrival_id
  end
end
