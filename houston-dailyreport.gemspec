$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "houston/dailyreport/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "houston-dailyreport"
  s.version     = Houston::Dailyreport::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Houston Dailyreport."
  s.description = "TODO: Description of Houston Dailyreport."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
end
