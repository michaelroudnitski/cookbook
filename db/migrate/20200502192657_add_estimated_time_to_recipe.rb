class AddEstimatedTimeToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :time_estimate, :integer
  end
end
