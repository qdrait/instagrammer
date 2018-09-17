Rails.application.routes.draw do
  resources :comments
  get 'favorites/new'
  get 'favorites/destroy'
  resources :users
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  get '/users/user_favorite/:id', to: 'users#user_favorite', as: 'user_favorite'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end