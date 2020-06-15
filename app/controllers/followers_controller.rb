class FollowersController < ApplicationController
  def create
    current_user.followings.create(permitted_params)
    redirect_to profile_user(permitted_params[:user_id])
  end

  private

  def permitted_params
    params.require(:users_follower).permit(:user_id)
  end
end
