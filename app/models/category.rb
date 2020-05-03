class Category < ApplicationRecord
  has_many :recipes, dependent: :delete_all
  ICONS = ["bread", "cookies", "cupcake", "flour", "pancakes", "pie", "rice", "steak"].map { |s| "#{s}.png" }
  validates_inclusion_of :icon, :in => ICONS
  validates :name, :icon, presence: true
end
