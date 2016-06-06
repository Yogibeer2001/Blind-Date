Rails.application.routes.draw do

  root to: "users#index"

  post '/preferences' => 'preferences#create'

  get '/preferences/new' => 'preferences#new'
  get '/preferences/edit' => "preferences#edit"

  patch '/preferences/update' => "preferences#update"
  get '/preferences/update' => "preferences#update"

  delete 'preferences/destroy' => "preferences#destroy"

  get '/signup' => 'users#new_user_form'
  post '/users' => 'users#create_user'
  get '/users' => 'users#edit'
  patch '/users/update' => 'users#update'


  post '/login' => 'sessions#create'
  get '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

get '/home' => 'sessions#home'


resources :conversations do
  resources :messages
end
resources :messages
 # delete  => 'messages#destroy'

end
