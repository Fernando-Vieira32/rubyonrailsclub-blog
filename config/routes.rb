# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'welcome/index'

  resources :articles, only: %i[show]

  namespace :administrate do
    get '/' => 'dashboards#index'

    resources :articles do
      member do
        delete :destroy_cover_image
      end
    end
    resources :categories
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'welcome#index'
  # Defines the root path route ("/")
  # root "posts#index"
end
