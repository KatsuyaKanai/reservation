class ReservationController < ApplicationController
 
  def room_id
    @room.id
  end

  def index
    @reservation = Reservation.all
    binding.pry
  end
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
  end


  
  def show
    @reservation = Reservation.find(params[:id])
    @reservation.user_id = current_user.id
    @room = Room.find(@reservation.room_id)
  end











  def update
  end
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
    @reservation.save
      redirect_to reservation_path(@reservation)
  end
  private
  
    def room_params
      params.require(:room).permit(:id, :user_id, :room_name, :room_introduction, :room_price, :room_address, :room_image)
      
    end
    def reservation_params
      params.permit(:room_id,:start_date,:end_date,:person_num,:total_price)
    end
  
end
