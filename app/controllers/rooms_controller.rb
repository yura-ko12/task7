class RoomsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def new
   @room = Room.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end



end
