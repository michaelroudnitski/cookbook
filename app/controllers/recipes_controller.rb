class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.build_category
  end
end
