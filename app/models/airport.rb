class Airport < ApplicationRecord
  has_many :departures, foreign_key: "departure_id", class_name: "Flight"
  has_many :arrivals, foreign_key: "arrival_id", class_name: "Flight"
  accepts_nested_attributes_for :departures
end
