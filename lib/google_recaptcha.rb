require 'action_view'

require File.join(File.dirname(__FILE__), 'google_recaptcha', 'verification')
require File.join(File.dirname(__FILE__), 'google_recaptcha', 'renderer')


module GoogleRecaptcha

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :site_key, :secret_key
  end
end

ActionView::Base.send :include, Renderer