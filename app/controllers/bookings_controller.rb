class BookingsController < ApplicationController

  def new
    @chosen_flight = Flight.where(id: params[:flight_id]).first
    @num_passengers = params[:number_of_passengers].to_i

    @booking = Booking.new
    @num_passengers.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|

      if @booking.save

        PassengerMailer.with(booking: @booking).booking_email.deliver_now

        format.html { redirect_to booking_path(@booking.id), notice: 'Booking successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking}
      else
        format.html { render action 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
