Rails.application.routes.draw do
  resources :recipes, only: :index

  get 'home/index'

  root 'home#index'
end
