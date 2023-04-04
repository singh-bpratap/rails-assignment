class HomeController < ApplicationController
  def index
    @tweets = Tweet.followings_tweets_for(current_user)
    @new_tweet = current_user.tweets.new
  end
end
