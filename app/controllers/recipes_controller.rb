class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def one_recipe_method
    @recipe = Recipe.first
    render "one_recipe.json.jbuilder"
  end
end
