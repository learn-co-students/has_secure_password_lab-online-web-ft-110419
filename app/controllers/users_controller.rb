class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            if @user.authenticate(params[:password])
                redirect_to home_path
            else
                redirect_to signup_path
            end
        end
    end

    def home
        if !session[:user_id]
            redirect_to signup_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end