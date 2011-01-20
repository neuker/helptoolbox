class TagsController < ApplicationController
  
  def index
    
    # @article = Article.find(:all, :conditions => ['tags LIKE ?', "%#{params[:id]}%"])
    
    # @articles = Article.find(:all, :conditions => ['tags LIKE ?', "%#{params[:id]}%"])
    @article = Article.find(:all, :conditions => ['tags LIKE ?', "%#{params[:id]}%"])
    
    # @article = Article.find params[:id]
    
    # if params[:search]
    #       @articles = Article.find(:all, :conditions => ['Desc LIKE ?', "%#{params[:search]}%"])
    #     else
    #       @articles = Article.find(:all)
    #     end
  end
  
end
