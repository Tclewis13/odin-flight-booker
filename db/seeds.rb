Airport.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Airport.table_name)

Airport.create!([ {
  name: "Atlanta",
  code: "ATL"
},
{
  name: "Boston",
  code: "BOS"
},
{
  name: "Seattle",
  code: "SEA"
},
{ name: "Los Angeles",
  code: "LAX"
},
{ name: "Houston",
  code: "IAH"
}
])

p "Created #{Airport.count} airports"

Flight.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Flight.table_name)

Flight.create!([ {
  departure: Airport.find(1),
  arrival: Airport.find(2),
  takeoff: "2024-11-14 08:05:06",
  duration: 120
},
{
  departure: Airport.find(3),
  arrival: Airport.find(1),
  takeoff: "2024-11-18 12:21:03",
  duration: 300
},
{
  departure: Airport.find(5),
  arrival: Airport.find(1),
  takeoff: "2024-11-15 16:50:34",
  duration: 180
},
{
  departure: Airport.find(2),
  arrival: Airport.find(5),
  takeoff: "2024-11-16 22:20:42",
  duration: 240
},
{
  departure: Airport.find(1),
  arrival: Airport.find(3),
  takeoff: "2024-11-17 10:40:22",
  duration: 300
}
])

p "Created #{Flight.count} flights"
