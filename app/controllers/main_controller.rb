class MainController < ApplicationController
  def index
    #hide flash messages keeping them only onetime for the one request
    #flash.now[:notice] = "Logged in successfully"
    #flash.now[:alert] = "Invalid email or password"
    if session[:user_id]
      # if user_id exists in session cookie, find user model
      @user = User.find_by(id: session[:user_id])
    end
  end
end