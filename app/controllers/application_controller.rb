class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  	def is_logged_in?
  		!!session[:user_id]
  	end
  	def current_user
  		if !session[:user_id].blank?
  			User.find_by_id(session[:user_id])
  		else
  			nil
  		end
  	end
end
