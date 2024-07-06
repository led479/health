class Product < ApplicationRecord
  has_many :product_state_bans
  has_many :banned_in_states, through: :product_state_bans, source: :state

  enum category: { birth_control: 0, emergency_contraception: 1, testing_kits: 2, otc_products: 3 } 
end