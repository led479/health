class State < ApplicationRecord
  has_many :product_state_bans
  has_many :banned_products, through: :product_state_bans, source: :product
  has_many :product_state_minimum_ages
  has_many :products_with_minimum_age, through: :product_state_minimum_ages, source: :product
end
