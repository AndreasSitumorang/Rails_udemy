class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  
  def new
    @user = User.new
  end

  def edit
    # @user = User.find(params[:id])
  end

  def show
    # @user = User.find(params[:id])
    @all_news = @user.news.paginate(page: params[:page], per_page: 7)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Hallo #{@user.username} your account has been updated"
      redirect_to dailynews_index_path
    else
      render 'edit'
    end
  end

  def destroy
    # byebug
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account and new has been deleted"
    redirect_to dailynews_index_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own profile"
      redirect_to user_path
    end
  end

end