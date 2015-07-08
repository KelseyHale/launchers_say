Rails.application.routes.draw do
  root 'homes#index'
  resources :videos, only: [:index, :new, :create]
  devise_for :users
end
