Rails.application.routes.draw do
  resources :categories, except: [:edit, :update]
  resources :recipes
  root "categories#index"
end
