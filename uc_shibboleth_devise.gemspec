$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "uc_shibboleth_devise/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "uc_shibboleth_devise"
  s.version     = UcShibbolethDevise::VERSION
  s.authors     = ["James Van Mil, Glen Horton, University of Cincinnati"]
  s.email       = ["vanmiljf@ucmail.uc.edu"]
  s.homepage    = "https://github.com/uclibs/"
  s.summary     = "Modtifications of to Devise to allow authentication against the University of Cincinnati Shibboleth service"
  s.description = "TODO: Description of UcShibbolethDevise."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "devise", "~> 3.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
end
