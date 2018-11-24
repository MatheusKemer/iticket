Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :tickets

  root "home#index"

  get "get-orders", to: "orders#get_orders"
end
