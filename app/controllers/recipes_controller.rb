class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.category_id)
  end

  def new
    @recipe = Recipe.new
    @recipe.build_category
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @category = @recipe.category
    if @recipe.save
      redirect_to category_path(@category), :success => "#{@recipe.name} recipe created!"
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.category_id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @category = Category.find(@recipe.category_id)
    @recipe.destroy
    redirect_to @category, :success => "Removed recipe: #{@recipe.name}"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:category_id, :name, :time_estimate, :ingredients, :instructions)
  end
end
