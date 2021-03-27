class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user| 
      user.permit(:full_name, :email, :password, :phone_number, :company_name, :company_address)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:full_name, :email, :password, :current_password, :phone_number, :company_name, :company_address)
    end
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_users_path : dashboard_path
  end

  def after_sending_reset_password_instructions_path_for(resource)
    resource.admin? ? admin_users_path : dashboard_path
  end
end
