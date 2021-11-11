class ApplicationController < ActionController::Base
    
    
    helper_method :current_user, :logged_in?  # mean that is also used as a helper method

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in? 
    !!current_user  #return a boolean
  end
  
  def require_user 

    if !logged_in? 
      flash[:alert] = "You must be in to perform that action"
      redirect_to login_path
    end

  end
    
end
