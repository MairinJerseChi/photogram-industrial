Rails.application.routes.draw do
  root "photos#index"
   #generate resources for only the user show page! 
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users

  get ":username/liked" => "photos#liked", as: :liked_photos 
  get "/:username" => "users#show", as: :user 
  get ":username/followers" => "users#followers", as: :user_followers 
  get "/:username/following" => "users#following", as: :user_following
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

