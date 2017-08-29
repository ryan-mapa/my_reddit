Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
