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
  
  def show
    @articles = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new params[:article]
    if @article.save
      flash[:success] = "#{@article.title} saved."
      #:flash => { :success => "#{@article.title} saved." }
      redirect_to @article
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find params[:id]
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
