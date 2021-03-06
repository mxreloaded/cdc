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

ActiveRecord::Schema[7.0].define(version: 2022_05_15_194651) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_shopcarts", force: :cascade do |t|
    t.bigint "shopcart_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.integer "promo_quantity"
    t.decimal "promo_value", precision: 8, scale: 2
    t.index ["product_id"], name: "index_products_shopcarts_on_product_id"
    t.index ["shopcart_id"], name: "index_products_shopcarts_on_shopcart_id"
  end

  create_table "shopcarts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopcarts_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shopcart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopcart_id"], name: "index_shopcarts_users_on_shopcart_id"
    t.index ["user_id"], name: "index_shopcarts_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "products_shopcarts", "products"
  add_foreign_key "products_shopcarts", "shopcarts"
  add_foreign_key "shopcarts_users", "shopcarts"
  add_foreign_key "shopcarts_users", "users"
end
