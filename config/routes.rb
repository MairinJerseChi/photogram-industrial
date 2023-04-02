Rails.application.routes.draw do
  root "photos#index"
   #generate resources for only the user show page! 
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users
  get "/:username" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
