class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t(".not_found")
    redirect_to signup_path
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash[:danger] = t(".foul_detection")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
