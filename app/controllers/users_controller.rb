class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    current_user
  end

  private

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end