Rails.application.routes.draw do
  get 'searchs/search'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/about' => 'homes#about'
  root 'homes#top'
  get 'search' => "searchs#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :follow, :follower
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
end