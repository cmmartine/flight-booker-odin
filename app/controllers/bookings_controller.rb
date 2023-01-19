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

    if @booking.save
      redirect_to booking_path(@booking.id)
      flash[:notice] = 'Booking successfully created.'
    else
      render :new, status: :unprocessable_entity
      flash[:error] = 'Unable to create booking, please try again.'
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
