# frozen_string_literal: true

# This is RegistrationsController controller
class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    if verify_recaptcha(model: resource)
      super
    else
      render 'new'
    end
  end

  def edit
   super
  end

  def update
    user = params[:user]
    user_find = User.find_by(email: user[:email]) || User.find_by(uid: user[:uid]) || User.find_by(username: user[:username])
    if user_find.present?
      user_find.update_attributes!(email: user[:email], first_name: user[:first_name], last_name: user[:last_name], username: user[:username], phone_number: user[:phone_number], date_of_birth: user[:date_of_birth], password: user[:password])
       respond_with resource, location: edit_user_registration_path
    else
      respond_with resource, location: edit_user_registration_path
    end
  end
end
