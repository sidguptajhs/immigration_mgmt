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

  create_table "employees", :id => false, :force => true do |t|
    t.integer  "employee_id",     :null => false
    t.string   "name",            :null => false
    t.string   "position",        :null => false
    t.string   "category",        :null => false
    t.date     "date_of_joining", :null => false
    t.string   "location",        :null => false
    t.date     "exit_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "employees", ["position"], :name => "index_employees_on_position"

  create_table "immigrations", :force => true do |t|
    t.string   "visa_id",         :null => false
    t.date     "date_of_journey"
    t.date     "date_of_return"
    t.string   "city"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "passports", :id => false, :force => true do |t|
    t.string   "passport_number", :null => false
    t.integer  "employee_id",     :null => false
    t.string   "citizenship"
    t.date     "date_of_expiry",  :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "visa_types", :id => false, :force => true do |t|
    t.string   "visa_type",  :null => false
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "visas", :force => true do |t|
    t.string   "visa_type_id", :null => false
    t.string   "passport_id",  :null => false
    t.string   "status",       :null => false
    t.date     "issue_date"
    t.date     "expiry_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_foreign_key "passports", "employees", name: "passports_employee_id_fk", primary_key: "employee_id", dependent: :delete

  add_foreign_key "visas", "passports", name: "visas_passport_id_fk", primary_key: "passport_number", dependent: :delete
  add_foreign_key "visas", "visa_types", name: "visas_visa_type_id_fk", primary_key: "visa_type", dependent: :delete

end
