class FollowersController < ApplicationController
  def create
    current_user.users_followings.create!(permitted_params)
    redirect_to profile_user_path(permitted_params[:user_id])
  end

  def destroy
    users_follower = current_user.users_followings.find_by(follower_id: current_user.id, user_id: params[:user_id])
    users_follower.destroy!
    redirect_to profile_user_path(params[:user_id])
  end

  private

  def permitted_params
    params.require(:users_follower).permit(:user_id)
  end
end
