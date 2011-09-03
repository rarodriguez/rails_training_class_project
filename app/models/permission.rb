class Permission < ActiveRecord::Base
# LOAD THE PERMISSIONS
#Permission::PERMISSION_LEVELS[0]

   PERMISSION_LEVELS = ['ADMIN','LEADER','USER']
   # three different options
   # 1-N
   #has_many :users
   
   # user.permissions << Permission.new(ATTRIBUTES)
   # user.permissions.push Permission.new(ATTRIBUTES)
   
   # 1-1
   #has_one :user
   #user.create_permission(ATTRIBUTES)
   
   # p = Permission.create(ATTRIBUTES)
   # user.permission = p
   # user.save
   
   # OPTION 1: N - M  USE IT JUST IF THE RELATION TABLE DOES NOT HAVE ATTRIBUTES
   has_and_belongs_to_many :employees
   
   # user.permissions << Permission.new(ATTRIBUTES)
   # user.permissions.push Permission.new(ATTRIBUTES)
   
   # IF WE HAVE ATTRIBUTES IN THE RELATION TABLE
   # Option 2:
   #has_many :permissions_user
   #has_many :users, :through => :permissions_users
   
   #N - 1 role_id
   #belongs_to :role, :foreign_key=> 'roles_id', :class_name => 'role'
   
end