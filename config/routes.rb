Rails.application.routes.draw do


  devise_for :users
  resources :relationships
  resources :users do
  	member do
  		get :following, :followers
  	end
  end

  resources :posts  #recurso para nuestras rutas
# Define root URL
root 'pages#index'

# Define routes for pages


  get '/home'		=>	'pages#home'

  get '/user/:id'	=>	'pages#profile'

  get '/explore'	=>	'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
