# frozen_string_literal: true

# This is confirmation controller
# class ConfirmationsController < Devise::ConfirmationsController
#   def show
#     self.resource = resource_class.confirm_by_token(params[:confirmation_token])
#     self.resource.skip_confirmation!
#     self.resource.save
#     yield resource if block_given?
#     if resource.errors.empty?
#       set_flash_message!(:notice, :confirmed)
#       respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
#      else
#        respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
#     end
#   end

#   protected

#   def after_confirmation_path_for(resource_name, resource)
#     if resource.companyadmin? || resource.director?
#       company = resource.company
#       if company
#         company.send_verification_notifications_after_confirmation(true, resource.confirmed?)
#       end
#     end
#     sign_in(:patron, resource)
#     if resource.director?
#       show_welcome_video
#     end
#     check_dashboard_video
#     track_corporate_login
#     welcome_path
#   end
# end
