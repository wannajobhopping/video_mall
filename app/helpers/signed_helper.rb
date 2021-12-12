
module SignedHelper
  def current_user
    if session[:video_mall].present?
      @vido_mall_user ||= User.find_by(id: session[:video_mall])
    else
      nil
    end
  end

  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end
end