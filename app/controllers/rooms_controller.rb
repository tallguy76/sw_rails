class RoomsController < ApplicationController
  def new
    @room  = Room.new
  end
  def create
    @room = Room.new(room_params)
    @room.player_id = session[:player_id]

    if @room.save
      redirect_to @room, notice: "Room was created successfully!"
    else
      render :action => "new"
    end
  end
  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(room_params)
      redirect_to @room, :notice => "Room was edited successfully!"
    else
      render :action => "edit"
    end
  end

  def show
    @room = begin
         Room.find(params[:id])
    rescue
      Room.first
    end
  end
  private
  def room_params
    params.require(:room).permit(:name,:description,:background_image,:player_id)
  end
  def set_room
    @room = Room.find(params[:id])
  end
end
