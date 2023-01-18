class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airport_options = (Airport.all.map { |port| [port.name, port.id] }).uniq.sort # To populate dropdown menu
    @flight_date_options = (@flights.map { |f| [f.date, f.date] }).uniq.sort

    departure_airport = params[:departure_airport_id]
    arrival_airport = params[:arrival_airport_id]
    date = params[:flight_date]
    @searched_flights = Flight.where(departure_airport_id: departure_airport, arrival_airport_id: arrival_airport, date: date).first(5)
  end
end
