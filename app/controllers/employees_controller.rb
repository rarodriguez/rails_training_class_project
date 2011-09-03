class EmployeesController < ApplicationController
   before_filter :require_employee
   before_filter :validate_permissions
   def index
	 @employees = Employee.all
   end
end