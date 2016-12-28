Rails.application.routes.draw do
  root 'top#index'

  resources :topics, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end

  match "topics/new", :via => :post

end
