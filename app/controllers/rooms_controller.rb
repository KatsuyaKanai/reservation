class RoomsController < ApplicationController
  
 # before_action :set_room, except: [:index, :new, :create]
  #before_action :authenticate_user!, except: [:show]

  def user_id
    user_id = @user.id
  end
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:id, :user_id, :room_name,:room_introduction,:room_price,:room_address,:room_image))
    @room.user_id = current_user.id
    binding.pry
    if @room.save!
      flash[:notice] = "登録しました"
      binding.pry
      redirect_to room_path(@room)
    else
      flash[:notice] = "失敗しました"
      render "new"
   end
  end

  def show
    
    @room = Room.find(params[:id])
   
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def location
  end

  def update
    @room = Room.find(params[:id])
    @reservation = Reservation.new(params.permit(:room_id,:start_date,:end_date,:person_num))
    if @reservation.save
    flash[:notice]= "保存しました。"
    redirect_to new_reservation_path(reservation_params)
    end
  end
  def after_room_path_for
    new_reservation_path(@reservation)
  end

  

  private
  
    def room_params
      params.require(:room).permit(:id, :user_id, :room_name, :room_introduction, :room_price, :room_address, :room_image)
      
    end
    def reservation_params
      params.permit(:room_id,:start_date,:end_date,:person_num,:total_price,:commit)
    end
end
