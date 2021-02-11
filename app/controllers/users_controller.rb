class UsersController < ApplicationController

  def new
    @user =User.new
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