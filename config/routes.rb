require 'sidekiq/web'
Rails.application.routes.draw do
  resources :users
  resources :twitter_messages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  mount Sidekiq::Web => "/sidekiq"
end
