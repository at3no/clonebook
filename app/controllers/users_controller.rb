class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed_users
    render :show_follow
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render :show_follower
  end
end
