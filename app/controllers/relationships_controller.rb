class RelationshipsController < ApplicationController
  before_action :require_user_logged_in  

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_back(fallback_location: followings_user_url(current_user))     
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_back(fallback_location: followings_user_url(current_user))
  end
end
