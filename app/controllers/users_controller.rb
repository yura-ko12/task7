class UsersController < ApplicationController
  def me
    @user = current_user
  end

  def index
    @user = current_user
    @rooms = Room.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "内容を更新しました"
        redirect_to "/users/#{current_user.id}"
    else
        flash[:notice] = "内容に不備があります"
        render "edit"
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
