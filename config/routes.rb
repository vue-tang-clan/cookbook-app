Rails.application.routes.draw do
  get "/recipes" => "recipes#index"
  get "/recipes/new" => "recipes#new"
  post "/recipes" => "recipes#create"
  get "/recipes/:id" => "recipes#show"
  get "/recipes/:id/edit" => "recipes#edit"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"

  namespace :api do
    namespace :v1 do
      get "/recipes" => "recipes#index"
      post "/recipes" => "recipes#create"
      get "/recipes/:id" => "recipes#show"
      patch "/recipes/:id" => "recipes#update"
      delete "/recipes/:id" => "recipes#destroy"

      post "/users" => "users#create"

      post "/sessions" => "sessions#create"
    end

    namespace :v2 do
      get "/recipes" => "recipes#index"
      post "/recipes" => "recipes#create"
      get "/recipes/:id" => "recipes#show"
      patch "/recipes/:id" => "recipes#update"
      delete "/recipes/:id" => "recipes#destroy"

      post "/users" => "users#create"

      post "/sessions" => "sessions#create"
    end
  end
end
