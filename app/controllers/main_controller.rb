class MainController < ApplicationController
  def index
    #nothing
    flash[:notice] = "Logged in successfully"
    flash[:alert] = "Invalid email or password"
  end
end