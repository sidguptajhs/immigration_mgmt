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

ActiveRecord::Schema.define(:version => 20140102054256) do

  create_table "employees", :force => true do |t|
    t.integer  "employee_number", :null => false
    t.string   "name",            :null => false
    t.string   "position"
    t.string   "category"
    t.string   "location"
    t.date     "date_of_joining", :null => false
    t.date     "exit_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "employees", ["employee_number"], :name => "index_employees_on_employee_number", :unique => true
  add_index "employees", ["position"], :name => "index_employees_on_position"

  create_table "immigrations", :force => true do |t|
    t.integer  "visa_id"
    t.date     "date_of_journey"
    t.date     "date_of_return"
    t.string   "city"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "immigrations", ["city"], :name => "index_immigrations_on_city"

  create_table "passports", :force => true do |t|
    t.integer  "employee_id"
    t.string   "passport_number", :null => false
    t.string   "citizenship"
    t.date     "date_of_expiry"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "passports", ["employee_id"], :name => "index_passports_on_employee_id", :unique => true
  add_index "passports", ["passport_number"], :name => "index_passports_on_passport_number", :unique => true

  create_table "visa_types", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "visa_types", ["country"], :name => "index_visa_types_on_country"
  add_index "visa_types", ["name"], :name => "index_visa_types_on_name", :unique => true

  create_table "visas", :force => true do |t|
    t.integer  "visa_type_id"
    t.integer  "passport_id"
    t.string   "status",       :null => false
    t.date     "issue_date"
    t.date     "expiry_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "visas", ["passport_id"], :name => "index_visas_on_passport_id"
  add_index "visas", ["visa_type_id"], :name => "index_visas_on_visa_type_id"

  add_foreign_key "passports", "employees", name: "passports_employee_id_fk", dependent: :delete

  add_foreign_key "visas", "passports", name: "visas_passport_id_fk", dependent: :delete
  add_foreign_key "visas", "visa_types", name: "visas_visa_type_id_fk", dependent: :delete

end
