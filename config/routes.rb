Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/user/search',   to: 'users#search'
  get    '/my_page',   to: 'users#my_page' 
  resources :users ,only: [:index, :new, :create]
  resources :users, path: '/', only: [:show, :edit, :update, :destroy]
  # resources :users, only: :show, param: :name
  resources :microposts         
  
end
