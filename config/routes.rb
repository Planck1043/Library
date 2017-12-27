Rails.application.routes.draw do
  root 'books#indexa'

  resources :users
  resources :sessions
  resources :borrows

  resources :books do
    collection do
      get 'indexa'
      get 'showa'
      post 'book_update'
      post 'add_to_borrow'
      post :return_book
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
