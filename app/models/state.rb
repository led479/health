class State < ApplicationRecord
  has_many :product_state_bans
  has_many :banned_products, through: :product_state_bans, source: :product
end
