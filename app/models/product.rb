class Product < ApplicationRecord
  enum category: { birth_control: 0, emergency_contraception: 1, testing_kits: 2, otc_products: 3 } 
end