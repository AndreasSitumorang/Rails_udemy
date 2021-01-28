class NewsController < ApplicationController

  def show
    @news = News.find(params[:id])
  end

  def index
    @all_news = News.all
  end

end