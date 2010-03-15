ActionController::Routing::Routes.draw do |map|
  map.root :controller => "blocks", :action => "new"
  map.resources :blocks, :has_many => :revisions
  
 
  map.connect ':controller/:action/:id', :controller => "blocks"
  map.connect ':controller/:action/:id.:format'
end
