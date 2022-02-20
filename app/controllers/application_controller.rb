class ApplicationController < ActionController::Base

  #before code related to any action is code this is executed
  before_action :set_current_user

  # this is going to be common code. hence do this logic in application controller centrally
  #if session[:user_id]
  # if user_id exists in session cookie, find user model
  #  @user = User.find_by(id: session[:user_id])
  #end

  def set_current_user
    if session[:user_id]
    # if user_id exists in session cookie, find user model
    #@user = User.find_by(id: session[:user_id])
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

end
