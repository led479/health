class CreateProductStateBans < ActiveRecord::Migration[6.1]
  def change
    create_table :product_state_bans do |t|
      t.references :product, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
