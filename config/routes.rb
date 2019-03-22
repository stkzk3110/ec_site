Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get '/products/new' => 'products#new'
  post '/products/new' => 'products#create'
  get '/products/:id' => 'products#show'

  resources :products, only: %i(new create)
end
