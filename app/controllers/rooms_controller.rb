class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ show edit update destroy ]
  
  before_action :set_status




  def index
    @rooms = Room.all
    current_user.update(status: "offline") if current_user
  end
  
  def show
    @new_message = Message.new(room: @room, user: current_user)
  end

  def new
    @room = Room.new
    
  end

  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to root_path
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

  def set_status
    current_user.update(status: "online") if current_user    
  end

end
