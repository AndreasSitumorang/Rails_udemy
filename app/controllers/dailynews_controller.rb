class DailynewsController < ApplicationController
  before_action :private_method, only: [:show, :edit, :update, :destroy]

  def show
    # byebug
    # @news = News.find(params[:id])
    # redirect_to dailynews_path
  end

  def index
    @all_news = News.all
  end

  def new
    @news = News.new
  end

  def edit
    # @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
    # render plain: @news_add.inspect
    if @news.save
      flash[:notice] = "Berita telah di buat" 
      redirect_to dailynews_path(@news)
    else
      render 'new'
    end  
      
  end

  def update
    
    # @news = News.find(params[:id])
    @new = params
    # render plain: @new.inspect
    if @news.update(params.permit(:headline, :information))
      flash[:notice] = "Berita telah di buat" 
      redirect_to dailynews_path(@news)
    else
      render 'edit'
    end  

  end

  def destroy
     # @news = News.find(params[:id])
     # byebug
     @news.destroy
     redirect_to dailynews_index_path
  end

  private #apapun dibawahini adalah private

  def private_method
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:headline, :information)
  end


end