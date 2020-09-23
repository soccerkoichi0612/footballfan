class ApplicationController < ActionController::Base
    
  include SessionsHelper
   
  def counts(user)
    @count_likes = user.likes.count
  end 
  
   
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  
end
