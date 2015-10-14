class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
      @user=User.find_by_id(session[:user_id])
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
