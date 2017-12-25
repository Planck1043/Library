Rails.application.routes.draw do
  root 'books#indexa'

  resources :users
  resources :sessions

  resources :books do
    collection do
      get 'indexa'
      get 'showa'
      post 'book_up'
      post 'book_down'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
