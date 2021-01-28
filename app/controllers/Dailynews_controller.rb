class DailynewsController < ApplicationController

  def show
    @news = News.find(params[:id])
  end

  def index
    @all_news = News.all
  end

  def new
  end

  def create
    @news_add = News.new(params.require(:news).permit(:headline, :information))
    # render plain: @news_add.inspect
    @news_add.save 
    redirect_to dailynews_path(@news_add)
  end

end