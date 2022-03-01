class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!
  # only run on destroy method invocation and not any other methods. we can comma separate methods
  before_action :set_twitter_account, only: [:destroy]

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    #@twitter_account = Current.user.twitter_accounts.find(params[:id])
    #will run callbacks also to delete associated entities from db hence better to use destroy
    @twitter_account.destroy

    redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
  end

  private
  def set_twitter_account
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
  end
end