require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)
# require File.expand_path('../../../../lib/markaby', __FILE__)

module AppRoot3
  class Application < Rails::Application
    config.encoding = "utf-8"
  end
end

class Monkey < Struct.new(:name)
  def self.find(*args)
    @@monkeys ||= ['Frank', 'Benny', 'Paul'].map { |name| Monkey.new name }
  end
end
