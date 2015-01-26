# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150126142157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["owner_id"], name: "index_groups_on_owner_id", using: :btree

  create_table "train_options", force: true do |t|
    t.integer  "train_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "train_options", ["train_id"], name: "index_train_options_on_train_id", using: :btree

  create_table "trains", force: true do |t|
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "departure_time"
  end

  add_index "trains", ["group_id"], name: "index_trains_on_group_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "train_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["train_option_id"], name: "index_votes_on_train_option_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  create_table "yelp_businesses", force: true do |t|
    t.integer  "train_option_id"
    t.string   "rating"
    t.string   "phone"
    t.string   "address"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "yelp_businesses", ["train_option_id"], name: "index_yelp_businesses_on_train_option_id", using: :btree

end
