class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  # For users who are following me.
  has_many :users_followers, dependent: :destroy, foreign_key: :follower_id
  has_many :followers, through: :users_followers, foreign_key: :follower_id
  # For users I am following to whom.
  has_many :users_followings, dependent: :destroy, foreign_key: :user_id, class_name: "UsersFollower"
  has_many :followings, through: :users_followings, foreign_key: :user_id, source: "user"
end
