Rails.application.routes.draw do
  devise_for :users

  root :to => "homes#top"
  get "home/about" => "homes#about"
  
  get '/search' => 'search#search'
  
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  resources :users, only: [:index, :show, :edit, :update] do
    member do
     get :follows, :followers
    end
  end
    
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end
