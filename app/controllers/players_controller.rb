class PlayersController < ApplicationController
  def edit
    @player = Player.find()
  end

  def create
    @player = Player.create(player_params)
    session[:player_id] = @player.id
    redirect_to Room.first, :notice => "Player created successfully!"
  end
  def new
    if session[:player_id]
      redirect_to Room.first
    else
      @player = Player.new
    end
  end
  private
  def player_params
    params.require(:player).permit(:name,:description,:avatar_image)
  end
end
