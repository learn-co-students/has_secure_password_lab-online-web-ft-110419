class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to welcome_path
        else
            redirect_to signup_path
        end
      end
     
      private
     
      def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
      end
end