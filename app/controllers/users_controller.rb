class UsersController < ApplicationController

  def new
    return redirect_to root_path if current_user
    @user=User.new
  end

  def create
  	@user=User.new(user_params)

  	if @user.save
  	  session[:user_id]=@user.id #login directly after register
  	  redirect_to root_path
  	else
  	  render 'new'
  	end
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

end
