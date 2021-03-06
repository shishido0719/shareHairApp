class UsersController < ApplicationController
  
  def index
    @search_params = user_search_params 
    @users = User.search(@search_params)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find_by(user_id: params[:id])
  end
  
  def show
    @user = User.find_by(user_id: params[:id])
    user_id = @user.id
    @microposts = Micropost.where("user_id=#{user_id}")
    if current_user ==  @user then
      redirect_to  controller: :users, action: :my_page
    end
  end
  
  def my_page
    @user = current_user
    user_id = @user.id
    @microposts = Micropost.where("user_id=#{user_id}")
  end
  
  def update
    @user = User.find_by(user_id: params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "プロフィールの更新が完了しました。"
      redirect_to @user
    else
      # エラーメッセージを作成する
      # flash.now[:danger] = 'Invalid email/password combination'
      render 'edit'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :user_id, :email, :user_image,
                                :birth_day, :region, :age, :sex,
                                :password,  :password_confirmation)
  end
  
  def user_search_params
    params.fetch(:search, {}).permit(:name, :sex)
  end
  
  
end
