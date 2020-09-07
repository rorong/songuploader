# frozen_string_literal: true

# This is Session Controller
class SessionsController < Devise::SessionsController
  def create
    return unless request.env['omniauth.auth'].present?

    @user = User.authenticate_social_login(request.env['omniauth.auth'])
    if @user.present? && @user.provider.present?
      # this will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path
    end
  end
end
