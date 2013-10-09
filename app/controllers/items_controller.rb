class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    # @item.room_id = params[:item][:room_id]
    @item.save
    @room = Room.find(@item.room_id)
    redirect_to room_path(@room)
  end
  def new
    @item = Item.new
    @room = Room.find(params[:room_id])
  end

  def edit
    @item = Item.find(params[:item_id])
    @room = Room.find(params[:room_id])
  end
  def update
     @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    @room = Room.find(@item.room_id)
    redirect_to @room, :notice => "Item was edited successfully!"
  end
    private
  def item_params
    params.require(:item).permit(:name,:description,:image_url,:x_coord, :y_coord, :room_id)
  end
=begin
  def set_item
    @item =Item.find(params[:id])
  end
=end
end
