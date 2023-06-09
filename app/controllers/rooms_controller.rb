class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    if params[:area] == "札幌"
      @rooms = @rooms.where('address LIKE ?', "%#{params[:area]}%").where('name LIKE ? OR introduction LIKE ?', "%#{params[:freeword]}%", "%#{params[:freeword]}%")
    else
      @rooms = @rooms.where('address LIKE ?', "#{params[:area]}%").where('name LIKE ? OR introduction LIKE ?', "%#{params[:freeword]}%", "%#{params[:freeword]}%") 
    end
  end

  def new
   @user = User.find(current_user.id)
   @room = Room.new
  end

  def create
    @user = User.find(current_user.id)
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to rooms_path
    else
      flash[:notice] = "入力内容に不備があります"
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    $room_id = params[:id]
  end

  def edit
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
      
    if @room.update(room_params)
      flash[:notice] = "内容を更新しました"
      redirect_to users_path
    else
      flash[:notice] = "内容に不備があります"
      render "edit"
    end
  end

  def destroy
    
  end

private

def room_params
  params.require(:room).permit(:name, :fee, :address, :introduction, :user_id, :room_image)
end

end
