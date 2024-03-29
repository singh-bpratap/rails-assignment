Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :tweets, only: [:index, :create]

  resources :users, only: [] do
    member do
      get :profile
    end
  end

  resources :followers, only: [:create, :destroy], param: :user_id
end
