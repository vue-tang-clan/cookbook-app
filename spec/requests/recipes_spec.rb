require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  before do
    user = User.create(name: "test", email: "test@email.com", password: "password")
    Recipe.create([
      {user_id: user.id, title: "Raw Eggs", chef: "Laura Parsley", ingredients: "Chicken", directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", prep_time: 1},
      {user_id: user.id, title: "Empty Sandwich", chef: "Jay Wengrow", ingredients: "Two slices of bread", directions: "Place slices of bread next to each other.", image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", prep_time: 72},
      {user_id: user.id, title: "Licorice", chef: "Jean Claude Packsone", ingredients: "Licorice", directions: "Buy licroice from store.", image_url: "http://www.seelecttea.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/l/i/licorice1.jpg", prep_time: 120},
      {user_id: user.id, title: "Mud Pie", chef: "Mark Richardson", ingredients: "Flour, water, mud.", directions: "Mix flour and water, add mud, bake at 350 degrees for 1 hour.", image_url: "http://cdn-image.myrecipes.com/sites/default/files/styles/300x300/public/image/recipes/sl/05/12/mocha-mud-pie-sl-257949-x.jpg?itok=_ChocANl", prep_time: 84},
      {user_id: user.id, title: "Pizza", chef: "The Swedish Chef", ingredients: "Flour, water, pepperoni, cheese", directions: "Mix flour and water, add cheese and pepperoni, shape as a heart, bake in oven on self-clean mode.", image_url: "http://twopizzapals.weebly.com/uploads/2/3/6/0/23602608/1338890_orig.jpg", prep_time: 455},
      {user_id: user.id, title: "Corn on the cob", chef: "Cornelius Vanderbilt", ingredients: "Corn, cob", directions: "Place corn on the cob, grill for 20 minutes, enjoy!", image_url: "http://www.scientificamerican.com/sciam/cache/file/59C0122F-509C-4FEE-99A67FC20C50CEF1.jpg", prep_time: 22}
    ])
  end

  describe "GET /api/v1/recipes" do
    it "should return an array of recipes sorted by title" do
      get "/api/v1/recipes"
      recipes = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(6)
      expect(recipes[0]["title"]).to eq("Corn on the cob")
    end
  end

  describe "GET /api/v1/recipes/:id" do
    it "should return a single recipe" do
      id = Recipe.first.id
      get "/api/v1/recipes/#{id}"
      recipe = JSON.parse(response.body)
      
      expect(recipe["title"]).to eq("Raw Eggs")
      expect(recipe["chef"]).to eq("Laura Parsley")
      expect(recipe["ingredients"]).to eq(["Chicken"])
    end
  end
end
