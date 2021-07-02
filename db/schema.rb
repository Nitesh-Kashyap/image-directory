# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_02_002628) do

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "file_type"
    t.integer "category"
    t.boolean "sale"
    t.float "price"
    t.boolean "tnc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
  end

  create_table "user_registrations", force: :cascade do |t|
    t.integer "phone"
    t.string "otp"
    t.integer "otp_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "secret_key"
  end

end