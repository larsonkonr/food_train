ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/config/"
  add_filter "/db/"
end
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require_relative "alex_factory"

OmniAuth.config.test_mode = true
YelpReader.test_mode = true

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include AlexFactory

  def log_in
    visit root_path
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(auth_hash)
    click_link_or_button "log-in"
  end

  def auth_hash
    {
      "provider" => "twitter",
      "uid" => "testuid",
      "info" => { "name" => "Trevor" }
    }
  end
end
