require 'sidekiq/web'

Rails.application.routes.draw do
  resources :tweets

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  namespace :admin do
    resources :users
    resources :announcements

    root to: "users#index"
  end

  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'tweets#index'
end
