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

ActiveRecord::Schema.define(version: 20160629205519) do

  create_table "aliquots", force: :cascade do |t|
    t.integer  "sample_id"
    t.float    "quantity"
    t.string   "qty_units"
    t.float    "concentration"
    t.string   "concent_units"
    t.string   "sample_container_type"
    t.integer  "freeze_thraw_count"
    t.string   "storage_status"
    t.string   "custodial_department_id"
    t.string   "location"
    t.string   "box_description"
    t.string   "nanopore_260_230_avg"
    t.string   "nanopore_260_280_avg"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "aliquots", ["sample_id"], name: "index_aliquots_on_sample_id"

  create_table "sample_aliases", force: :cascade do |t|
    t.integer "sample_id"
    t.string  "name"
    t.string  "typeCast"
    t.boolean "top",       default: false
  end

  add_index "sample_aliases", ["sample_id"], name: "index_sample_aliases_on_sample_id"

  create_table "samples", force: :cascade do |t|
    t.string   "study_name"
    t.string   "rlims_id"
    t.string   "family_id"
    t.string   "alias_name"
    t.string   "alias_type"
    t.string   "sample_type"
    t.string   "treatments"
    t.string   "preparation"
    t.string   "patient_id"
    t.string   "patient_id_type"
    t.string   "patient_initials"
    t.string   "full_name"
    t.date     "birth_date"
    t.datetime "collection_date"
    t.datetime "create_date"
    t.string   "visit_description"
    t.string   "source"
    t.text     "notes"
    t.string   "tissue_tumor_flag",    limit: 2
    t.string   "tissue_normal_flag",   limit: 2
    t.string   "tissue_abnormal_flag", limit: 2
  end

end
