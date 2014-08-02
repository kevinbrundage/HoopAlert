class StaticPagesController < ApplicationController
  def home
  end
  
  def office
    #This will be the "home_page" for anyone logging in 
    # who has any privileges which allow him to administer anything (in addition to his own account)
  end
  
  def locker
    #This will be the "home_page" for anyone loggin in
    #who doesn't have any administration privileges other than
    #his own account
  end
  
  def registration_success
  end
end
