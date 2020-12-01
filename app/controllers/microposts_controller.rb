class MicropostsController < ApplicationController
  
  def index
    @microposts = Micropost.all
  end
  
  def new
    @micropost = current_user.microposts.build if logged_in?
  end
    
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "新規投稿が完了しました。"
      redirect_to user_path(current_user)
    else
      render new_micropost_path
    end
  end
  
  def show
    @micropost = Micropost.find(params[:id])
  end
  
  def micropost_params
      params.require(:micropost).permit(:content, :image)
  end
  
end
