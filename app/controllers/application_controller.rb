class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_lg_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def ensure_login
    redirect_to ouath_login unless current_user
  end
end
