Ft::Application.routes.draw do
  namespace :admin do resources :roles end
  namespace :admin do resources :users end	

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
