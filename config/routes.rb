Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/signin', to: 'sessions#sign_in', as: 'signin'
  post '/singin', to: 'sessions#create'

  root to: 'application#home'
end
