class TeamsController < ApplicationController
  def index
    @teams = Team.order(id: :desc).page(params[:page]).per(25)
  end

  def show
  end
end
