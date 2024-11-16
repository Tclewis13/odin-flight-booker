class Flight < ApplicationRecord
  belongs_to :arrival, class_name: "Airport"
  belongs_to :departure, class_name: "Airport"
  has_many :bookings

  def flight_date_formatted
    takeoff.strftime("%m/%d/%Y")
  end

  def self.get_flight_dates
    Flight.find_by_sql("select distinct takeoff from flights where takeoff is not null order by takeoff asc")
  end

  def flight_info
    "#{self.departure.name} to #{self.arrival.name} Takeoff: #{self.takeoff} Duration: #{self.duration}"
  end

  def self.search(params)
    if params[:departure_id] && params[:arrival_id] && params[:takeoff]
      departure_airport = Airport.find(params[:departure_id])
      arrival_airport = Airport.find(params[:arrival_id])
      flight_date = Date.parse(params[:takeoff])
      if arrival_airport && departure_airport && flight_date
        self.where(departure_id: departure_airport, arrival_id: arrival_airport, takeoff: flight_date.all_day)
      else
        @flights = Flight.all
      end
    else
      @flights = Flight.all
    end
  end
end
