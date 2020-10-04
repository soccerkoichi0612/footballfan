class TeamsController < ApplicationController
  before_action :require_user_logged_in, only: [:create]
  
  def index
    @teams = Team.order(id: :desc).page(params[:page]).per(25)
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @fans = Team.find(params[:id]).fans
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
    end
    @microposts = @team.microposts.order(id: :desc).page(params[:page])
  end
  
  def create
    @team = Team.create(team_params)
    if @team.save
      flash[:success] = 'チームを追加しました。'
      redirect_to teams_url
    else
      @teams = Team.order(id: :desc).page(params[:page]).per(25)
      flash.now[:danger] = 'チームの追加に失敗しました。'
      render '/teams/index'
    end
  end
  
  private
  
  def team_params
    params.require(:team).permit(:name, :image_file)
  end

end
