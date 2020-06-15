class HomeController < ApplicationController
  def index
    @tweets = Tweet.followings_tweets_for(current_user)
  end
end
