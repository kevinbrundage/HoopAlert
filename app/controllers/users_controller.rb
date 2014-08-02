class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to registration_success_path
      #TODO - redirect to office_path for admins, locker_path for non-admins, maybe add "bleacher_path" for non-admin non-players (i.e., fans) NOTE: change this.  this redirect functionality should be done on login, not registration
    else
      render 'new'
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
