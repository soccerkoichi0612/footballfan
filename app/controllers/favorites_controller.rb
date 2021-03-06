class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    team = Team.find(params[:favorite][:team_id])
    current_user.favorite(team)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: teams_url)
  end

  def destroy
    team = Team.find(params[:favorite][:team_id])
    current_user.unfavorite(team)
    flash[:success] = 'お気に入りからはずしました。'
    redirect_back(fallback_location: teams_url)
  end
  
end
