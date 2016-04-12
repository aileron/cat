Cat::Application.routes.draw do
  root :to => 'cats#index'
  match '/reload', :to=> 'cats#reload'
  match '/gallery' => 'cats#gallery'
  match '/:id', :to=> 'cats#show'
end
