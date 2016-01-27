Rails.application.routes.draw do
  #root
  root to: 'static_pages#home'
  
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
  
  #micropost
  resources :microposts
  
  #relationships
  resources :relationships, only: [:create, :destroy]
  
  #show_follower
  get "users/:id/follower", to: "users#follower"

  #show_followed
  get "users/:id/followed", to: "users#followed"

end

