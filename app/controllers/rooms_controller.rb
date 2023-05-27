class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @rooms = @rooms.where('address LIKE ?', "%#{params[:area]}%") if params[:area].present?
  end

  def new
   @user = User.find(current_user.id)
   @room = Room.new
  end

  def create
    @user = User.find(current_user.id)
    @room = Room.new(params.require(:room).permit(:name, :fee, :address, :introduction, :user_id))
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to rooms_path
    else
      flash[:notice] = "入力内容に不備があります"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
      
    if @room.update(params.require(:room).permit(:name, :fee, :address, :introduction, :user_id))
      flash[:notice] = "内容を更新しました"
      redirect_to users_path
    else
      flash[:notice] = "内容に不備があります"
      render "edit"
    end
  end

  def destroy

  end



end
