Helptoolbox::Application.routes.draw do |map|
  
  get "sessions/new"

  map.resources :articles, :sessions
  
  map.home '', :controller => 'articles', :action => 'index'
  
  # resources :sessions, :only => [:new, :create, :destroy]
  
  match '/login', :to => 'sessions#new'
  
  map.login 'login', :controller => 'sessions', :action => 'create'  
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  
  # map.tags 'tags', :controller => 'tags', :action => 'tags'
  
  match "/tags" => "tags#index"
  match "/tags/:id" => "tags#index", :controller => 'tags', :action => 'index', :id => nil, :requirements => { :id => /.+/ }

  
end
