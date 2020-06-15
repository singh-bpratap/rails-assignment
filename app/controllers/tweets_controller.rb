class TweetsController < ApplicationController
  def index
    tweets = Tweet.followings_tweets_for(current_user)
    render json: tweets.to_json 
  end

  def create
  end
end
