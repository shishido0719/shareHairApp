Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  get    '/user/search_man',   to: 'users#search_man'
  get    '/user/search_woman',   to: 'users#search_woman'
  get    '/user/search',   to: 'users#search'
end
