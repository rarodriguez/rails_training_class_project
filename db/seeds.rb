# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

employee1 = Employee.create([{:full_name=>'Panchito Carrasco',:email => 'admin@gap.com', :password => '123Admin', :password_confirmation => '123Admin', :began_working_at_gap_at=>Date.today}])
employee1.permissions << Permission.create({:name=>'user_admin',:permission_level => 1, :module_name => 'EMPLOYEES'})

employee2 = Employee.create([{:full_name=>'Fulano Perez',:email => 'empleado@gap.com', :password => '123Empleado', :password_confirmation => '123Empleado', :began_working_at_gap_at=>Date.today}])
employee2.permissions << Permission.create({:name=>'user_leader',:permission_level => 2, :module_name => 'VACATIONS'})
