class Tweet < ApplicationRecord
  belongs_to :user

  scope :user_followings_tweets, -> (user_id) {
    joins(user: {followings: :tweets})
      .where(user_id: user_id)
  }

  def self.followings_tweets_for(user)
    [
      *self.user_followings_tweets(user),
      *joins(:user)
    ]
  end
end
