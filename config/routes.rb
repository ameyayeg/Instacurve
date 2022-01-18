Rails.application.routes.draw do
  root 'images#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/upload', to: 'images#new'
  resources :images, only: [:show, :create, :destroy, :index]

  get '/@:username', to: 'users#show', as: :profile
end