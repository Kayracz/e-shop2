Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  root 'store#index'
  resources :products
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
end
