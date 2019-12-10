Rails.application.routes.draw do
  root  'home#index'
  get 'home/index', to: 'home#index' 
  devise_for :users
  resources :articles, except: :delete

  delete 'articles/:id', to: "articles#destroy", as: :delete_article
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
