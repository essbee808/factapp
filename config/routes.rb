Rails.application.routes.draw do

  resources :posts, only: [:new, :show, :index, :edit]
  post '/posts', to: 'posts#create'

  resources :categories, only: [:new, :create, :show, :index, :edit]
  #POST "/posts/:id", to: "posts#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
