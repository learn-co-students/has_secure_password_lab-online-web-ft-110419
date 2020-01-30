Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/welcome' => 'users#index'

  # post '/logout' => 'sessions#destroy'
end
