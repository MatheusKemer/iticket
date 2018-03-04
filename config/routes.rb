Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :tickets

  root "home#index"
end
