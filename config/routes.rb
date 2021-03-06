Kandan::Application.routes.draw do

  devise_for :users, :controllers => {
    :sessions => "sessions"
  }

  root :to => "main#index"

  get '/search' => "main#search"

  resources :channels do
    resources :activities
    resources :attachments
  end

  resources :users, :only => [:index, :show]

  get "/active_users" => "apis#active_users"
  get "/me" => "apis#me"
  get "/last_created_channel" => "apis#last_created_channel"
  get "/add_user_to_channel/:user_channel"  => "apis#add_user_to_channel"
  get "/remove_user_from_channel/:user_channel"  => "apis#remove_user_from_channel"

  get "/users/edit" =>"main#users_edit"

  namespace :admin do
    root :to => "admin#index"
    post "/update", :to => "admin#update", :as => "update"
    post "/update_user", :to => "admin#update_user", :as => "update_user"
    post "/toggle_admin", :to => "admin#toggle_admin"
  end

  # Pages Controller
  get "/approval", :to => "pages#approval"
  get "/suspended", :to => "pages#suspended"
  get "/about", :to =>"pages#about"

end
