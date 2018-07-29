/* global axios */

var recipeTemplate = document.querySelector("#recipe-card");
var recipeContainer = document.querySelector(".row");

axios.get("http://localhost:3000/api/v1/recipes").then(function(response) {
  var recipes = response.data;
  recipes.forEach(function(recipe) {
    console.log(recipe);
    var recipeClone = recipeTemplate.content.cloneNode(true);
    recipeClone.querySelector(".card-title").innerText = recipe.title;
    recipeClone.querySelector(".card-img-top").src = recipe.image;
    recipeContainer.appendChild(recipeClone);
  });
});
