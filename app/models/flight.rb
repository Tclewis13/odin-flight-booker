class Flight < ApplicationRecord
  belongs_to :arrival, class_name: "Airport"
  belongs_to :departure, class_name: "Airport"
end
