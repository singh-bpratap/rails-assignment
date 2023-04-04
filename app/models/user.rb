class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  # For users who are following me.
  has_many :users_followers, dependent: :destroy, foreign_key: :user_id
  has_many :followers, through: :users_followers, foreign_key: :user_id
  # For users I am following to whom.
  has_many :users_followings, dependent: :destroy, foreign_key: :follower_id, class_name: "UsersFollower"
  has_many :followings, through: :users_followings, foreign_key: :follower_id, source: "user"

  def unfollowings
    User.where.not(id: [id, *users_followings.pluck(:follower_id)])
  end

  def username
    email.split("@").first
  end

  def follow?(user)
    user.users_followers.where(follower_id: id).exists?
  end
end
