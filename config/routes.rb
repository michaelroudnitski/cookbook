Rails.application.routes.draw do
  resources :categories, except: [:edit, :update] do
    resources :recipes, except: [:new] do
    end
  end
  get "recipes/new", to: "recipes#new"
  root "categories#index"
end
