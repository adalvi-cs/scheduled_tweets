class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def destroy

  end

  def show

  end

  def new
    @tweet = Tweet.new
  end

end