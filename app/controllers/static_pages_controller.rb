class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.all
  end

  def help
  end
end
