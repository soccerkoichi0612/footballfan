class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @team = Team.find(params[:micropost][:team_id])
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to @team
    else
      @team = Team.find(params[:micropost][:team_id])
      @microposts = @team.microposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'teams/show'
    end
  end
  
  def edit
   @micropost = Micropost.find(params[:id])
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    @team = Team.find(params[:micropost][:team_id])
    if @micropost.update(micropost_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @team
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @team = @micropost.team
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to @team
  end
  
  private

  def micropost_params
    params.require(:micropost).permit(:content, :team_id)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_back(fallback_location: root_path)
    end
  end
end