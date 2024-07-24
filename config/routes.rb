Rails.application.routes.draw do
  get 'help' => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
