class TagsController < ApplicationController
  
  def index
    @articles = Article.find(:all, :joins => :tags, :conditions => { :tags => { :name => params[:id] } })
    @tags =  Tag.find( :all, :select => "DISTINCT name", :order => "name ASC" )
    
    # User.find(:all, :joins => :article,
    #       :conditions => { :articles => { :published => true } })
      
    # if params[:search]
    #       @articles = Article.find(:all, :conditions => ['Desc LIKE ?', "%#{params[:search]}%"])
    #     else
    #       @articles = Article.find(:all)
    #     end
  end
  
end
