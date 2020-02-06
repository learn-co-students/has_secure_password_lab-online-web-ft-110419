Rails.application.routes.draw do
  resources :users
  resources :sessions
  get 'users/signup', to: 'users#signup'
  get 'sessions/login', to: 'sessions#new', as: 'new'
  # get 'users/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
