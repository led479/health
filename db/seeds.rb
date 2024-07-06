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
    new_state = State.new(
      name: state[0], 
      abbreviation: state[1], 
      service_offered: state[2], 
      minimum_age: state[3]
    )
    new_state.save
  end
end

PRODUCTS.each do |product|
  if Product.find_by(ndc: product[:ndc]).blank?
    new_product = Product.new(
      name: product[:name], 
      category: categories_map[product[:category]], 
      ndc: product[:ndc], 
      qty: product[:qty], 
      price: product[:price], 
      instructions: product[:instructions]
    )
    new_product.save
  end
end

if Patient.find_by(email: 'led479@gmail.com').blank?
  new_patient = Patient.new(name: 'Rolf Zambon', email: 'led479@gmail.com', dob: DateTime.parse('1998-11-21'), state: State.find_by(abbreviation: 'TX'))
  new_patient.save
end
