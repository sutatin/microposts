Rails.application.routes.draw do
  get 'users/new'

  root to: 'static_page#home'
  get "signup", to: "users#new"
  
  resources :users
end
