class NewsController < ApplicationController

  def show
    byebug
    @news = News.find(params[:id])
  end

end