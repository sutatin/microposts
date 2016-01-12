Rails.application.routes.draw do
  #root
  root to: 'static_page#home'
  
  #signup
  get "signup", to: "users#new"
  
  #login,out
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  #users
  resources :users

  #session
  resources :sessions, only: [:new,:create,:destroy]

end

