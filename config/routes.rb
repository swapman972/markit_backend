Rails.application.routes.draw do
  resources :trains, only: [:index]
  resources :bikes, only: [:index]
  resources :ratings, only: [:index, :create]
  resources :events, only: [:index, :show, :create]
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
