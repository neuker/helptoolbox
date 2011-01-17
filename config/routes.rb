Helptoolbox::Application.routes.draw do |map|
  
  # get "sessions/new"
  #   
  #   resources :articles, :sessions
  #   
  #   home '', :controller => 'articles', :action => 'index'
  #   
  #   match '/login', :to => 'sessions#new'
  
  get "sessions/new"

  map.resources :articles, :sessions
  
  map.home '', :controller => 'articles', :action => 'index'
  
  # resources :sessions, :only => [:new, :create, :destroy]
  
  match '/login', :to => 'sessions#new'
  
  map.login 'login', :controller => 'sessions', :action => 'create'  
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  
end
