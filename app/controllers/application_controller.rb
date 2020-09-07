# frozen_string_literal: true

# This is application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:phone_number,:date_of_birth,:username,:terms_agreed])
  end

  def after_sign_in_path_for(resource)
    if current_admin.present?
     rails_admin_path
    else
     dashboard_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found
  end
end
