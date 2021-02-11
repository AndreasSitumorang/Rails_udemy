class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @all_news = @user.news
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Hallo #{@user.username} your account has been updated"
      redirect_to dailynews_index_path
    else
      render 'edit'
    end
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hallo #{@user.username} wellcome to the team, you can expres your self"
      redirect_to dailynews_index_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end