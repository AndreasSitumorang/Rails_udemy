class DailynewsController < ApplicationController

  def show
    @news_to_show = News.find(params[:id])
  end

  def index
    @all_news = News.all
  end

  def new
  end

  def create
    render plain: params[:news]
  end
end