require 'rails_helper'

RSpec.feature "User searches for flights" do
  before do
    Rails.application.load_seed
  end
  scenario "they see flights that correspond to their choices if available" do

    visit root_path
    select('NYC', from: "departure_airport_id")
    select('EWR', from: 'arrival_airport_id')
    select('2', from: 'number_of_passengers')
    select('2023-01-28', from: 'flight_date')
    click_on "Search"
    choose 'flight_id'
    click_on 'Continue to Booking'
    expect(page).to have_content("Departing from: NYC")
  end
end