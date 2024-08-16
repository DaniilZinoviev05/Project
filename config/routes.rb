Rails.application.routes.draw do
  get 'session/new'
  get 'help' => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'pages#home'

  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts, only: [:create, :destroy]
end
