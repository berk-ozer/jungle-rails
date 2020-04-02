class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    # If user exists and password entered is correct
    if @user && @user.authenticate(params[:password])

      # Save user id as cookie so they stay logged in
      session[:user_id] = @user.id
      redirect_to :root

    else 
      render :new
    end
    
  end

  def destroy
  end
end
