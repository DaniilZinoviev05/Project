Rails.application.routes.draw do
  get 'session/new'
  get 'help' => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root "pages#home"

  resources :users
end
