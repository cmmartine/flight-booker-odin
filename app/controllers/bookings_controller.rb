class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path
      flash[:notice] = 'Booking successfully created.'
    else
      render :new, status: :unprocessable_entity
      flash[:error] = 'Unable to create booking, please try again.'
    end
  end
end
