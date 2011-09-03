class LoginController < ApplicationController
   def index
	 
   end
   
   def login
   @employee_session = EmployeeSession.new
   end
end