# -*- encoding: utf-8 -*-
require File.expand_path('../lib/placed/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "placed"
  s.version     = Placed::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Txarli San"]
  s.email       = ["gabriel@pixind.com"]
  s.homepage    = "https://github.com/pixind/placed"
  s.summary     = %q{Google Places API.}
  s.description = %q{This gem provides very basic functionalities to interact with Google Places API.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'httparty'

end