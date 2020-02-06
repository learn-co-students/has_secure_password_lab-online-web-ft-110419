class UsersController < ApplicationController
	def new
		if !is_logged_in?
			@user = User.new
			render 'new'
		else 
			flash[:message] = "You are already logged in."
			redirect_to homepage_path
		end
	end
	def create
		@user = User.new(params.require(:user).permit(:name, :password, :password_confirmation, :email))
		if @user.save 
			session[:user_id] = @user.id
			redirect_to homepage_path
		else
			# @errors = @user.errors
			# render 'new'
			redirect_to signup_path
		end
	end
	def homepage
		@user = current_user
	end
end