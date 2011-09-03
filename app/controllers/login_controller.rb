class LoginController < ApplicationController
   #before_filter :require_no_employee
   def login
	@employee_session = EmployeeSession.new
   end
   
   def validate_user
		@employee_session = EmployeeSession.new params[:employee_session]
		if @employee_session.save
		  redirect_to list_employees_path
		else
		  render :login
		end
   end
end