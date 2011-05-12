# Load the rails application
require File.expand_path('../application', __FILE__)
 require 'rackamole'
  config.middleware.use Rack::Mole, { :app_name => "LAPSA", :user_key => :user_name }
# Initialize the rails application
Lapsa::Application.initialize!
