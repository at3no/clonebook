Rails.application.routes.draw do
  root 'top#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :topics do
    resources :comments

    collection do
      post :confirm
    end
  end

  match "topics/new", :via => :post

  resources :users, only: [:index]
  resources :relationships, only: [:show, :create, :destroy]

  resources :users do
    member do
      get :followed, :followers
    end
  end

  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
