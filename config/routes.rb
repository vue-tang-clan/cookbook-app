Rails.application.routes.draw do
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
