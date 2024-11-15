json.extract! flight, :id, :departure, :arrival, :takeoff, :duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
