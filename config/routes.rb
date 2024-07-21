Rails.application.routes.draw do
  get 'pages/help'
  get 'pages/about'
  get 'pages/home'
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
