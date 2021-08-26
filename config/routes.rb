Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "organisations#index"
  resources :organisations
  get "/join/:id", to: "organisations#join", as: "join_organisation"
  post "/", to: "shifts#create"
end
