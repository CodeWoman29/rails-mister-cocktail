class Dose < ApplicationRecord
  belongs_to :ingredient, dependent: :destroy
  belongs_to :cocktail, dependent: :destroy

# A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.

  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }

end
