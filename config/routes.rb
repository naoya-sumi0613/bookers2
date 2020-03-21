Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/about' => 'homes#about'
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :homes, only: [:top, :about]
end