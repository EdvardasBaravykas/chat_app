class MessagesController < ApplicationController
  before_action :authenticate_user!, :set_room, only: %i[ new create]
  

  def new
    @message = @room.messages.new
   
  end


  def create
    @message = @room.messages.new(messages_params)
    @message.user = current_user
    @message.save
    

  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def messages_params
    params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id)
  end

end
