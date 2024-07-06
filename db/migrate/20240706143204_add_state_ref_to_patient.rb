class AddStateRefToPatient < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :state, null: false, foreign_key: true
  end
end
