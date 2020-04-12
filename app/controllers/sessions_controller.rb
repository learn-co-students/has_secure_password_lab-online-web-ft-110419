class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to :signup
      flash.alert = "You must be logged in"
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end