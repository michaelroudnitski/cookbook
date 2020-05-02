class Recipe < ApplicationRecord
  belongs_to :category
  accepts_nested_attributes_for :category
  validates :name, :ingredients, :instructions, :category, :presence => true
end
