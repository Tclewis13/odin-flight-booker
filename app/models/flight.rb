class Flight < ApplicationRecord
  belongs_to :arrival, class_name: "Airport"
  belongs_to :departure, class_name: "Airport"

  def flight_date_formatted
    takeoff.strftime("%m/%d/%Y")
  end

  def self.get_flight_dates
    Flight.find_by_sql("select distinct takeoff from flights where takeoff is not null order by takeoff asc")
  end

  def self.search(params)
    if params[:departure_id]
      airport = Airport.find(params[:departure_id])
      if airport
        self.where(departure_id: airport)
      else
        @flights = Flight.all
      end
    else
      @flights = Flight.all
    end
  end
end
