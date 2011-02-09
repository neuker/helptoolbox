class ArticlesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  
  def index
    @articles = Article.search(params[:search])
    @tags =  Tag.find( :all, :select => "DISTINCT name", :order => "name ASC" )
    
    # @tags2 = Tag.find_all_by_article_id(@articles)
    # if params[:search]
    #       @articles = Article.find(:all, :conditions => ['Desc LIKE ?', "%#{params[:search]}%"])
    #     else
    #       @articles = Article.find(:all)
    #     end
  end
  
  def show
    @article = Article.find(params[:id])
    @title = @article.title
    @tags = Tag.find_all_by_article_id(@article)
  end
  
  # def tags
  #     @article = Article.find(:all, :conditions => ['tags LIKE ?', "%#{params[:id]}%"])
  #   end
  
  def new
    @article = Article.new
    2.times { @article.tags.build }
    5.times { @article.assets.build }
  end
  
  def create
    @article = Article.new params[:article]
    if @article.save
      flash[:success] = "#{@article.title} saved."
      #:flash => { :success => "#{@article.title} saved." }
      redirect_to @article
    else
      flash.now[:error] = "Missing data"
      render :new
    end
  end
  
  def edit
    @article = Article.find params[:id]
    5.times { @article.assets.build }
  end
  
  def update
    @article = Article.find params[:id]
    if @article.update_attributes(params[:article])
          # it worked
          redirect_to @article, :flash => { :success => "Updated." }
        else
          # it failed
          render :edit
        end
  end
  
  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "Deleted"
    redirect_to articles_path
  end

end
