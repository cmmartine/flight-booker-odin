# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airport.create!([{ name: 'NYC' }, { name: 'JFK' }, { name: 'EWR' }])
p "Created #{Airport.count} Airports"

Flight.create!([{ departure_airport_id: 1, arrival_airport_id: 1, duration: 2.5, date: "2023-04-29" }, { departure_airport_id: 1, arrival_airport_id: 2, duration: 2.5, date: "2023-02-15" }])
Flight.create!([{ departure_airport_id: 3, arrival_airport_id: 1, duration: 2.5, date: "2023-03-14" }])
p "Created #{Flight.count} Flights"
