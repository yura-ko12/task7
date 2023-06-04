class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.where(user_id:@user.id)
  end

  def new
    @reservation = Reservation.new
    @user = current_user
    @room = Room.find($room_id)
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :num_of_persons, :user_id, :room_id))
    @user = current_user
    @room = Room.find($room_id)
    if @reservation.save
      redirect_to "/reservations/#{@reservation.id}/reconfirm"
    else
      flash[:notice] = "入力内容に不備があります"
      render "new"
    end
  end

  def reconfirm
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @num_of_days = (@reservation.check_out - @reservation.check_in).to_i
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @num_of_days = (@reservation.check_out - @reservation.check_in).to_i
  end

  def edit

  end

  def update

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to rooms_path
  end


end
