Rails.application.routes.draw do
  resources :dashboard, only: :index
  root 'employees#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :notices
  resources :employees do
    resources :profiles
  end
end
