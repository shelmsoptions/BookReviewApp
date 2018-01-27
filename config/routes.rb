Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  devise_for :users
  authenticate :user do
    root to: 'users#index'
    resources :users
  end
end