class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json { render json: { success: true, user_name: @user.id} }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, error_messages: @user.error_messages} }
      end
    end
  end

  def sign_in
    email = params[:email]
    encrypted_password = Digest::SHA1.hexdigest("qidftmw#{params[:password]}mdsfjiw")
    if User.find_by(email: email, encrypted_password: encrypted_password)
      user = User.find_by(email: email, encrypted_password: encrypted_password)
      session[:video_mall] = user.id
      respond_to do |format|
        format.json { render json: { success: true, user_name: user.id} }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, message: '查無此帳號'} }
      end
    end
  end

  def sign_out
    session[:video_mall] = nil
    respond_to do |format|
      format.json { render json: { success: true, message: '已成功登出'} }
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
