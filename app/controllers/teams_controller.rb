class TeamsController < ApplicationController
  def index
    @teams = Team.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @team = Team.find(params[:id])
    @fans = Team.find(params[:id]).fans
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
    end
    @microposts = @team.microposts.order(id: :desc).page(params[:page])
  end
end
