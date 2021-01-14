class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.all
    @users = User.all
    @ranking_microposts = Micropost.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end
end
