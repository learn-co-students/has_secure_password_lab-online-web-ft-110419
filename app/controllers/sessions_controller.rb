class SessionsController < ApplicationController
	def new
		if !is_logged_in?
			render 'login'
		else
			redirect_to homepage_path
		end

	end
	def create
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect_to homepage_path
		else
			flash[:alert] = "Incorrect username or password."
			redirect_to login_path
		end
	end
	def destroy
		session.delete(:user_id)
		redirect_to homepage_path
	end
end