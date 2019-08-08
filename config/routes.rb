Rails.application.routes.draw do
  root to: 'pages#home'

  resources :cockails do
      resources :ingredients, only: [:index, :new, :create]
    end

    resources :doses, only: [:new, :create, :destroy]
    resources :cocktails, only: [:index, :new, :create, :show]
end
