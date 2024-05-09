# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "addresses", id: false, force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "api_responses", id: false, force: :cascade do |t|
    t.integer  "code"
    t.string   "type"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "username"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.integer  "id"
    t.integer  "pet_id"
    t.integer  "quantity"
    t.datetime "ship_date"
    t.string   "status"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "name"
    t.string   "category"
    t.string   "photo_urls"
    t.string   "tags"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.integer  "user_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
