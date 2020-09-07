# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '678256886067913', '223a3edac45c3fdf2891adfd8d17de2c', scope: 'email', info_fields: ' first_name, last_name, email'
  provider :linkedin, '81dqwt6tl3olhi', 'u0sA97s95jYKzo7x'
  provider :spotify, ENV["client_id"], ENV["client_secret"],scope: 'user-read-email'
end
