class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_sidebar

  def load_sidebar
    # @sidebar = "sidebar data"
    
    # @sidebar = Article.all(:select => "tags")
    # @sidebar = Article.find( :all, :select => "tags", :order => "tags ASC" )
    # sidebar = Article.find( :all, :select => "tags", :order => "tags ASC" )
    # sidebar = Article.find_by_sql "select tags from articles"
    
    sideData = "";
    # for i in (0..sidebar.length)
    #   # puts sidebar[i].to_s
    #   sideData = sideData + "\n" + sidebar[i].inspect + " i = " + i.to_s 
    # end
    
    # sidebar.each do |key, value|
    #      sideData = sideData + "... " + value.to_s
    #   end
    #    
    #    @sidebar = sideData
    
    # @sidebar = sidebar.length
    # for article in @articles do
    #         @sidebar = article.tags
    #     end
  end
  
  helper_method :admin?
  
  protected
  
  def admin?
    session[:password] == "90foo"
  end
  
  def authorize
    unless admin?
     flash[:error] = "Unauthorized access"
     redirect_to home_path
     false
    end
  end
  
end
