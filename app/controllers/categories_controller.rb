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
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
