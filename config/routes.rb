Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resources :photos, only: :create
    resources :games, only: :create
  end
  resources :users, only: :show
  get '/search' => 'games#search', :as => 'search_page'
end
