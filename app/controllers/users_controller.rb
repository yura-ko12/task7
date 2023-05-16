class UsersController < ApplicationController
  def me
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

    def update
      @user = User.find(params[:id])
      
      if @user.update(params.require(:user).permit(:name, :introduction))
        flash[:notice] = "内容を更新しました"
        redirect_to "/users/#{current_user.id}"
      else
        binding.pry
        flash[:notice] = "内容に不備があります"
        render "edit"
      end
    end
  
end
