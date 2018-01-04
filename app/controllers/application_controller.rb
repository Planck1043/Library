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
    if !current_user.present?
      flash[:notice] = "你不是管理员"
      redirect_to '/'
    end
  end

  helper_method :current_borrow

  def current_borrow
    @current_borrow ||= find_borrow
  end

  private

  def find_borrow
    borrow = Borrow.find_by(id: session[:borrow_id])

    if borrow.blank?
      borrow = Borrow.create
    end

    session[:borrow_id] = borrow.id
    return borrow
  end
end
