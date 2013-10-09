class ConnectionsController < ApplicationController
  def new
    @room = Room.find(params[:starting_room_id])
    @connection = Connection.new
  end

  def create
    Connection.create(connection_params)
    @room = Room.find(connection_params[:starting_room_id])
    redirect_to room_path(@room)
  end

  def edit
    @room = Room.find(params[:room_id])
    @connection = Connection.find(params[:connection_id])
  end
  def update
    @connection = Connection.find(params[:id])
    @connection.update_attributes(connection_params)
    @room = Room.find(@connection.starting_room_id)
    redirect_to @room, :notice => "Connection was edited successfully!"
  end
private
  def connection_params
    params.require(:connection).permit(:starting_room_id,:ending_room_id,:connection_name)
  end
end
