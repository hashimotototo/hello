class UsersController < ApplicationController
  before_action :set_user, only: [:likes]

    def show
      @user = User.find(params[:id]) 
    end
    
    def favorites
      @user = User.find(params[:id])
      favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
      @favorite_posts = Post.find(favorites)
    end
  
  end