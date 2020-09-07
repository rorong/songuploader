# frozen_string_literal: true

# This is ConfirmationController controller
class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    self.resource.skip_confirmation!
    yield resource if block_given?
    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource) { redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity) { render :new }
    end
  end

  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    dashboard_path
  end
end
