class ArticlesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  
  def index
    @articles = Article.search(params[:search])
    # if params[:search]
    #       @articles = Article.find(:all, :conditions => ['Desc LIKE ?', "%#{params[:search]}%"])
    #     else
    #       @articles = Article.find(:all)
    #     end
  end
end
