module CategoriesHelper
  def img_file_name(img)
    img.split("/").last
  end
end
