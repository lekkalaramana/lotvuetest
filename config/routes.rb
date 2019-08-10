Rails.application.routes.draw do
	root 'users#dashboard'
	get '/hide_roles' => "users#hide_roles"
	post '/role_create' => "users#role_create"
	get '/show_users' => 'users#show_users'
	get '/show_users_based_on_role' => 'users#show_users_based_on_role'
	resources :users
end
