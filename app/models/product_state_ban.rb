class ProductStateBan < ApplicationRecord
  belongs_to :product
  belongs_to :state

  validates_uniqueness_of :product_id, scope: :state_id, :message => "product can't be banned on the same state twice"
end