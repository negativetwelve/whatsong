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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121218081136) do

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.text     "images"
    t.integer  "cid"
    t.string   "collection_type"
    t.decimal  "price"
    t.string   "type"
    t.string   "link"
    t.integer  "duration"
    t.string   "sample"
    t.integer  "tid"
    t.integer  "aid"
    t.integer  "gid"
    t.integer  "rank"
    t.text     "rank_history"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "youtube_id"
    t.string   "artist_name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
