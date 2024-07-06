class CreateProductStateMinimumAges < ActiveRecord::Migration[6.1]
  def change
    create_table :product_state_minimum_ages do |t|
      t.references :product, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.integer :age

      t.timestamps
    end
  end
end
