class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user

	before_action :require_login

  private

  def require_login
    unless current_user
      redirect_to new_user_registration_url
    end
  end

	def current_user
		@current_user ||= UserRegistration.find(session[:user_id]) if session[:user_id]
	end
end
