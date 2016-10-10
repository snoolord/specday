Rails.application.routes.draw do
  resources :users
  resource :session
  resources :comments, only: [:create]
end
