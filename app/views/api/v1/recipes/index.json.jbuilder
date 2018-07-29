json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.chef recipe.chef
  json.ingredients recipe.ingredients
  json.directions recipe.directions
  json.prep_time recipe.prep_time
  json.image recipe.image_url
end

