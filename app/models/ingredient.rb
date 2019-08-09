class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

# An ingredient must have a unique name.
  validates :name, uniqueness: true, presence: true

end
