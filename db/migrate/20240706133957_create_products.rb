class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category
      t.string :ndc
      t.integer :qty
      t.decimal :price
      t.string :instructions

      t.timestamps
    end
  end
end
