class EmployeeSession < Authlogic::Session::Base
  validate :generic_error, :on=>:create
  
  def generic_error
    if((@email == nil && @password != nil) || (@email != nil && @password == nil))
      errors.clear
      errors.add_to_base("You did not provide enough details for authentication.")
    elsif errors.count > 0
      errors.clear
      errors.add_to_base("Sorry, we couldn't find that account and password combination.")
    end
  end
end