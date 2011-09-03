class Employee < ActiveRecord::Base
  has_and_belongs_to_many :permissions
  
  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end
  
  # CALLBACKS!!!
  def before_save
  end
  
  def before_create
    # EXECUTES WHEN THE ELEMENT IS CREATED
  end
  
  def after_create
  end
  
  def before_update
  end
  
  def after_update
  end
  
  def before_validate
  end
  
  def after_validate
  end
  
  
  def after_save
  end
  
  
end