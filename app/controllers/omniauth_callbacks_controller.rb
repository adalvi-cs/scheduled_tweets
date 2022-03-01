class OmniauthCallbacksController < ApplicationController
  before_action :require_user_logged_in!

  def twitter
    #render plain: "Success!"
    #Rails.logger.info "auth: #{auth}"
    #Rails.logger.info "auth-info: #{auth.info}"
    #get first twitter_account found or create one and use it - so there is only one per user
    #Current.user.twitter_accounts.create(
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected your account"
  end

  def auth
    request.env['omniauth.auth']
  end
end