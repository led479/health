# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_06_152025) do

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "state_id", null: false
    t.index ["state_id"], name: "index_patients_on_state_id"
  end

  create_table "product_state_bans", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_state_bans_on_product_id"
    t.index ["state_id"], name: "index_product_state_bans_on_state_id"
  end

  create_table "product_state_minimum_ages", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "state_id", null: false
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_state_minimum_ages_on_product_id"
    t.index ["state_id"], name: "index_product_state_minimum_ages_on_state_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.string "ndc"
    t.integer "qty"
    t.decimal "price"
    t.string "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.boolean "service_offered"
    t.integer "minimum_age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "patients", "states"
  add_foreign_key "product_state_bans", "products"
  add_foreign_key "product_state_bans", "states"
  add_foreign_key "product_state_minimum_ages", "products"
  add_foreign_key "product_state_minimum_ages", "states"
end
