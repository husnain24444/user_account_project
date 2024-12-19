Rails.application.routes.draw do
  devise_for :users
  resources :accounts, only: %i[index show edit update]
  root 'accounts#index'
end
