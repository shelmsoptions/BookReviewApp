Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root to: 'users#index'
    resources :users
  end
end