class ToppagesController < ApplicationController
  def index
    if logged_in?
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    end
  end
end
