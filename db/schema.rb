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

ActiveRecord::Schema.define(version: 20170308172716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_lists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "federal_legislators", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_federal_legislators_on_user_id", using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "social_uid"
    t.string   "username"
    t.string   "social_site"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["social_site"], name: "index_identities_on_social_site", using: :btree
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "list_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "custom_list_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["custom_list_id"], name: "index_list_users_on_custom_list_id", using: :btree
    t.index ["user_id"], name: "index_list_users_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "site"
    t.text     "link"
    t.text     "content"
    t.datetime "posting_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["posting_time"], name: "index_posts_on_posting_time", using: :btree
    t.index ["site"], name: "index_posts_on_site", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "state_governors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_state_governors_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "federal_legislators", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "list_users", "custom_lists"
  add_foreign_key "list_users", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "state_governors", "users"
end
