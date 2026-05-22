module ApplicationHelper
  def current_user_admin?
    session[:user] && session[:user].admin?
  end

  def logged_in?
    !session[:user].nil?
  end

  def find_user_by_bp_username(bp_username)
    return nil if bp_username.blank?
    user = LinkedData::Client::Models::User.get("#{$BP_REST_URL}/users/#{bp_username}")
    return nil if user.nil?
    return nil if user.respond_to?(:errors) && user.errors
    user
  end
end
