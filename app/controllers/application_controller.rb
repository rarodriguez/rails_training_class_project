class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #helper_method :current_employee_session, :current_employee
  
  before_filter :current_employee
  
  private
    # Validates the permissions that the user has in the app
	def validate_permissions(module_name, permission_level)
	  if current_employee && current_employee.has_permission? module_name, permission_level
		#store_location
		flash[:notice] = "You must be logged in to access this page"
		redirect_to employee_session_url
		return false
	  end
	end
	
	def current_employee_session
	  return @current_employee_session if defined?(@current_employee_session)
	  @current_employee_session = EmployeeSession.find
	end

	def current_employee
	  return @current_employee if defined?(@current_employee)
	  @current_employee = current_employee_session && current_employee_session.employee
	end

	def require_employee
	  unless current_employee
		#store_location
		flash[:notice] = "You must be logged in to access this page"
		redirect_to employee_session_url
		return false
	  end
	end

	def require_no_employee
	  if current_employee
		#store_location
		flash[:notice] = "You must be logged out to access this page"
		redirect_to list_employees_url
		return false
	  end
	end
end
