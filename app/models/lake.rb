class Lake < ApplicationRecord
include Kaminari::PageScopeMethods
  has_many :species, dependent: :destroy  # Destroys associated species when a lake is deleted
  has_and_belongs_to_many :activities
  # Existing lake attributes...
  validates :name, presence: true
  validates :area, numericality: { greater_than: 0 }

end
