Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    resources :teams, only: [:index, :show]
    
    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create] do
      member do
        get :likes
        get :followings
        get :followers
      end
    end

    
    resources :microposts, only: [:create, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
end
