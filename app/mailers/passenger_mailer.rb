class PassengerMailer < ApplicationMailer

  default from: 'flight_bookers@example.com'

  def booking_email
    @booking = params[:booking]
    mail(to: @booking.passengers.pluck(:email), subject: 'Booking Confirmed')
  end
end
