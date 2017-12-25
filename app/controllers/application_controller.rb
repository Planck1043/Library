class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :auth_user
  # before_action :user_taken!

  # def user_taken!
  #   if current_user.nil?
  #     redirect_to new_session_path
  #   end
  # end

  def admin_required
    if !current_user.admin?
      redirect_to '/', alert: "你不是管理员"
    end
  end


  # protected
  #
  # def auth_user
  #   unless logged_in?
  #     flash[:notice] = "请登录"
  #     redirect_to login_url
  #   end
  # end
end
