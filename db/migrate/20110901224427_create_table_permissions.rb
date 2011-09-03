class CreateTablePermissions < ActiveRecord::Migration
  def self.up 
   create_table :permissions do |t|
  	  t.string :name, :null=> false
  	  t.string :module_name
  	  t.integer :permission_level
  	  
  	  # use timestamps
  	  t.timestamps
  	end
  	add_index :permissions, ["module_name"], :name => "index_permissions_on_module_name"
  end

  def self.down
     drop_table :permissions
  end

end
