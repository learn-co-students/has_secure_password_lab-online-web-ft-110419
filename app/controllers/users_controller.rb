class UsersController < ApplicationController

    def new 

    end 

    def create
        @user = User.new(set_params)
        if set_params[:password] != set_params[:password_confirmation]
            redirect_to new_user_path
        else  
            @user.save
            session[:user_id] = @user.id
        end
    end 

    def index
    
    end 

    private 

    def set_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
