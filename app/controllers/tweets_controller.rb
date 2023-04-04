class TweetsController < ApplicationController
  def index
    tweets = Tweet.followings_tweets_for(current_user)
    render json: tweets.to_json
  end

  def create
    current_user.tweets.create(permitted_params)
    redirect_to root_path
  end

  private

  def permitted_params
    params.require(:tweet).permit(:content)
  end
end
