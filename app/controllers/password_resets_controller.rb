class PasswordResetsController < ApplicationController
  def new

  end

  def create
    #look up user by email
    @user = User.find_by(email: params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    #redirect to sign_in_path or passsword_reset path
    redirect_to sign_in_path, alert: "Your token expired. Please try again!"
    #binding.irb
  end

  #User isn't signed in. and we don't want to log in user just in order to update password. So we need the token to be present on the form submitted to look up user by token
  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end