# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_map = {
  'Birth Control': 0,
  'Emergency Contraception': 1,
  'Testing Kits': 2,
  'OTC Products': 3
}.with_indifferent_access

STATES.each do |state| 
  if State.find_by(abbreviation: state[1]).blank?
    State.create(
      name: state[0], 
      abbreviation: state[1], 
      service_offered: state[2], 
      minimum_age: state[3]
    )
  end
end

PRODUCTS.each do |product|
  if Product.find_by(ndc: product[:ndc]).blank?
    Product.create(
      name: product[:name], 
      category: categories_map[product[:category]], 
      ndc: product[:ndc], 
      qty: product[:qty], 
      price: product[:price], 
      instructions: product[:instructions]
    )
  end
end

if Patient.find_by(email: 'led479@gmail.com').blank?
  Patient.create(name: 'Rolf Zambon', email: 'led479@gmail.com', dob: DateTime.parse('1998-11-21'), state: State.find_by(abbreviation: 'TX'))
end

product = Product.first
state = State.first

product.banned_in_states.push(state) unless product.banned_in_states.include?(state)