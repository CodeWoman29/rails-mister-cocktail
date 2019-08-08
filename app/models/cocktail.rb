class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

# A cocktail must have a unique name.
  validates :name, uniqueness: true, presence: true
end
