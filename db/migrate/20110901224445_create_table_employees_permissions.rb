class CreateTableEmployeesPermissions < ActiveRecord::Migration
  def self.up
  
    create_table :employees_permissions, :id=>false do |t|
      t.integer   :permission_id, :null => false
      t.integer   :employee_id,  :null => false
    end
    add_index :employees_permissions, ["permission_id", "employee_id"], :name => "index_employees_permissions_on_both_keys", :unique => true
    add_index :employees_permissions, ["employee_id"], :name => "index_employees_permissions_on_employee_id"
    add_index :employees_permissions, ["permission_id"], :name => "index_employees_permissions_on_permission_id"
	
	#execute <<-SQL
    #  ALTER TABLE products
    #    ADD CONSTRAINT fk_products_categories
    #    FOREIGN KEY (category_id)
    #    REFERENCES categories(id)
    #SQL
  end

  def self.down
    remove_index :employees_permissions, "index_employees_permissions_on_both_keys"
    remove_index :employees_permissions, "index_employees_permissions_on_employee_id"
    remove_index :employees_permissions, "index_employees_permissions_on_permission_id"
    drop_table :employees_permissions
  end
end
