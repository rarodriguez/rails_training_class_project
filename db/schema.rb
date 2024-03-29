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

ActiveRecord::Schema.define(:version => 20110901224445) do

  create_table "employees", :force => true do |t|
    t.string   "full_name",                              :null => false
    t.text     "address"
    t.date     "began_working_at_gap_at",                :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",             :default => 0, :null => false
    t.integer  "failed_login_count",      :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["persistence_token"], :name => "index_employees_on_persistence_token", :unique => true

  create_table "employees_permissions", :id => false, :force => true do |t|
    t.integer "permission_id", :null => false
    t.integer "employee_id",   :null => false
  end

  add_index "employees_permissions", ["employee_id"], :name => "index_employees_permissions_on_employee_id"
  add_index "employees_permissions", ["permission_id", "employee_id"], :name => "index_employees_permissions_on_both_keys", :unique => true
  add_index "employees_permissions", ["permission_id"], :name => "index_employees_permissions_on_permission_id"

  create_table "permissions", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "module_name"
    t.integer  "permission_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["module_name"], :name => "index_permissions_on_module_name"

end
