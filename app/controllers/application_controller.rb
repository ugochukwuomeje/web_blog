class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #making a method helper method makes it available to your views
  #By default method that you create in application_controller are available to other controllers
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #if the current user has been retrieved before, return it else get it from the 
    #database and retur it. this is so that it will not be hitting database anytime you 
    #request for the user 
  end

  def logged_in?
    !!current_user #if their is a current user return true else false
  end

  def required_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
