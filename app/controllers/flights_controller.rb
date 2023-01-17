class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airport_options = Airport.all.map { |port| [port.name, port.id] } # To populate dropdown menu
    @flight_date_options = @flights.map { |f| [f.date, f.date] }
  end
end
