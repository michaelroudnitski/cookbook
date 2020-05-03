class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("name ASC")
  end

  def new
    @category = Category.new
    @images = Dir.glob("#{Rails.root}/app/assets/images/food/*.png")
  end

  def create
    @category = Category.new(category_params)
    @images = Dir.glob("#{Rails.root}/app/assets/images/food/*.png")

    if @category.save
      redirect_to root_path, :success => "Created new category: #{@category.name}"
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path, :success => "Removed category: #{@category.name}"
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
