Rails.application.routes.draw do
  get "likes/:post_id/destroy" => "posts#destroy"
  get "likes/:post_id/create" => "posts#laugh_create"
  post "users/create" => "posts#user_create"
  post "login" => "posts#login"
  get "logout" => "posts#logout"
  post "posts/create" => "posts#post_create"
  
  
  get "sign" => "posts#sign"
  
  

  get "signup" => "posts#new"
  get "login" => "posts#login"
  get "/" => "posts#index"
  get "time" => "posts#time"
  get "posts/:id" => "posts#show"


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

