Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root to: 'books#index'
    resources :users
    resources :books
    resources :reviews
  end
end