class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    #params[:user]
    #set instance variable that can be rendered in html template of mailer
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 10.minutes)

    mail to: params[:user].email
  end
end
