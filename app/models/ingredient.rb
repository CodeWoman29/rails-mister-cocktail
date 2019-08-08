class Ingredient < ApplicationRecord
  has_many :doses

# An ingredient must have a unique name.
  validates :name, uniqueness:true, presence:true

private
  def cleanup
    if self.is_fired?
      self.jobs.destroy_all
      self.coworkers.destroy_all
      self.company_credit_cards.destroy_all
    end
  end
end
