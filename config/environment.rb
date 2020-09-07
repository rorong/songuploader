# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Recaptcha.configure do |config|
  config.site_key  = '6LfApMcUAAAAALlcZLkmSjRDsO5kyvM9VqXiCIHD'
  config.secret_key = '6LfApMcUAAAAAJbejHo2hFnTneOPQ4HIIqqhJcTY'
end
Rails.application.initialize!
