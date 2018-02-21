Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    root to: 'books#index'
    resources :users
    resources :books
    get 'edit_book_details/:id', to: 'books#edit_book_details', as: :edit_book_details
    patch 'update_book_details/:id', to: 'books#update_book_details', as: :update_book_details
    resources :reviews
  end
end