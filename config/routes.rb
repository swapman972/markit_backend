Rails.application.routes.draw do
  resources :trains
  resources :bikes
  resources :ratings
  resources :events
  resources :users
  # get "/events/restaurant", to: "events#restaurant"
  # get "/events/pool", to: "events#pool"
  # get "/events/coffee", to: "events#coffee"
  # get "/events/music", to: "events#music"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
