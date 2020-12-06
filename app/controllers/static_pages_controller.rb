class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.all
    @users = User.all
  end
end
