class ProductStateMinimumAge < ApplicationRecord
  belongs_to :product
  belongs_to :state

  validates_uniqueness_of :product_id, scope: :state_id, message: "product can't have multiple ages on same state"
  validates :age, presence: true
end