$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "google_recaptcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "google_recaptcha"
  s.version     = GoogleRecaptcha::VERSION
  s.authors     = ["Gagan Shrestha"]
  s.email       = ["ckgagan@gmail.com"]
  s.homepage    = "https://github.com/ckgagan/google_recaptcha"
  s.summary     = "attach google recaptcha to ror site."
  s.description = "Description of GoogleRecaptcha."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'actionview', '~> 4.2', '>= 4.2.1'
  s.add_runtime_dependency 'rest-client', '~> 1.8', '>= 1.8.0'

end
