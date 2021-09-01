class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(signup_params)
    if user.save
      redirect_to login_path, success: "User successfully created"
    else
      redirect_to new_user_path, alert: "Unable to create user: #{user.errors.full_messages.join(", ").downcase}"
    end
  end

  private

  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def redirect_if_logged_in
    redirect_to root_path if session[:user_id]
  end
end
