Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    resources :teams, only: [:index, :show]
    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create]
    
    resources :microposts, only: [:create, :edit, :update, :destroy]
end
