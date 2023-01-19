Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "flights#index"

  resources :flights, only: [:index]

  resources :bookings, only: [:new, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
