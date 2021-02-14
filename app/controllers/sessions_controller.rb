class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:new_user, notice: "Login successfully")
    else
      flash.now[:alert] = "Login failed"
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:new_session, notice: "Logged out!")
  end
end
