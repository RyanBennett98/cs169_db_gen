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

ActiveRecord::Schema.define(version: 20190426053345) do

  create_table "users", force: :cascade do |t|
    t.string   "UC_SRCH_CRIT"
    t.integer  "STUDENT_ID",       limit: 16
    t.integer  "CAMPUS_ID",        limit: 16
    t.integer  "OPRID",            limit: 16
    t.string   "LAST_NAME"
    t.string   "FIRST_NAME"
    t.string   "MIDDLE_NAME"
    t.string   "UC_PRF_FIRST_NM"
    t.string   "UC_PRF_MIDDLE_NM"
    t.string   "EMAIL_ADDR"
    t.string   "ACAD_PROG"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
