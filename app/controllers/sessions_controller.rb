class SessionsController < ApplicationController 

    def new
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id
                redirect_to home_path
            else
                redirect_to signup_path
            end
        end
    end

end