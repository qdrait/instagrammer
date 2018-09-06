Rails.application.routes.draw do
  resources :comments
  get 'favorites/new'
  get 'favorites/destroy'
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
