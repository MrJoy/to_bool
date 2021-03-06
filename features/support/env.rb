ENV['TZ'] = 'UTC'
ENV['RAILS_ENV'] ||= 'test'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'cucumber'

require 'minitest/spec'

class MinitestWorld
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end
end

World do
  MinitestWorld.new
end

require_relative '../../lib/test/simplecov'


# The code under test:
require_relative '../../lib/to_bool'
