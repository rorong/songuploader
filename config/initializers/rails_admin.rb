RailsAdmin.config do |config|
  ### Popular gems integration
 # config.model 'Artist' do
 #    navigation_label 'artist'
 # config.authorize_with do
 #    redirect_to main_app.root_path unless current_user.admin?
 #  end
 #  end
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
    config.current_user_method(&:current_admin)
  end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      only [Song]
    end
    show
    edit do
      only [Song]
    end
    delete

  # config.excluded_models = [Image]
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
