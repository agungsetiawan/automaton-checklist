class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    @user=User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id]=@user.id

      redirect_to root_path
    else
      @error="Username and / or password don't match"
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to login_path
  end

end
