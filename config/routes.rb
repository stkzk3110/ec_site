Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root 'products#index'
  resource :basket, only: %i(show)
  resource :charge, only: %i(create)
  resources :products, only: %i(show) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create)
      resources :delete_in_baskets, only: %i(create)
    end
  end

  namespace :admins do
    root to: "dashboards#index"
    resources :products, only: %i(new create)
    resource :sales_record, only: %(show)
  end
end
