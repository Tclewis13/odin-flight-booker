class AddBookingIdToPassenger < ActiveRecord::Migration[7.2]
  def change
    add_column :passengers, :booking_id, :integer
  end
end
