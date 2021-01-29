class DailynewsController < ApplicationController

  def show
    @news = News.find(params[:id])
  end

  def index
    @all_news = News.all
  end

  def new
    @news = News.new
  end

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(params.require(:news).permit(:headline, :information))
    # render plain: @news_add.inspect
    if @news.save
      flash[:notice] = "Berita telah di buat" 
      redirect_to dailynews_path(@news)
    else
      render 'new'
    end  
      
  end

  def update
    
    @news = News.find(params[:id])
    @new = params
    # render plain: @new.inspect
    if @news.update(params.permit(:headline, :information))
    # byebug
    # if @news.update(params.require(:news).permit(:headline, :information))
      flash[:notice] = "Berita telah di buat" 
      redirect_to dailynews_path(@news)
    else
      render 'edit'
    end  

  end

end
