class CreateTableEmployees < ActiveRecord::Migration
  def self.up
	create_table :employees do |t|
	  t.string :full_name, :null=>false, :size=>100
	  t.text :address
	  t.date :began_working_at_gap_at, :null=>false
	  t.string :email, :null=>false
	  
	  #authlogic REQUIRED
	  t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
	  
	  #authlogic OPTIONAL!
	  t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
	  
	  t.timestamps
	end
	
	add_index :employees, ["email"], :name => "index_employees_on_email", :unique => true
    add_index :employees, ["persistence_token"], :name => "index_employees_on_persistence_token", :unique => true
  end

  def self.down
	remove_index :employees, "index_employees_on_email"
    remove_index :employees, "index_employees_on_persistence_token"
	drop_table :employees
  end
end
