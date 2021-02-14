class UsersController < ApplicationController
  before_action :require_login, except: %i[new create activate]
  before_action :set_user, only: %i[show edit update destroy]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "Created!"
    else
      flash.now[:alert] = "Create failed"
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Updated!"
    else
      flash.now[:alert] = "Update failed"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_session_path, notice: "Destroyed!"
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(new_session_path, :notice => "User was successfully activated.")
    else
      not_authenticated
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
