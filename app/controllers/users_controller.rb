class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(root_path, notice: '註冊成功')
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def sign_in; end

  def sign_out; end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
