Rails.application.routes.draw do

  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/user/search',   to: 'users#search'
  get    '/my_page',   to: 'users#my_page' 
  get    '/user/show',   to: 'users#show'
  resources :users 
  resources :microposts         
  
end
