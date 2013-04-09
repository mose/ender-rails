# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ender-rails/version', __FILE__)

Gem::Specification.new do |g|
  g.authors       = ["mose"]
  g.email         = ["mose@mose.com"]
  g.description   = %q{Install Ender and the Jeesh in rails.}
  g.summary       = %q{Install Ender and the Jeesh in rails.}
  g.homepage      = "https://github.com/mose/ender-rails"

  g.files         = `git ls-files`.split($\)
  g.executables   = g.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  g.test_files    = g.files.grep(%r{^(test|spec|features)/})
  g.name          = "ender-rails"
  g.require_paths = ["lib"]
  g.version       = EnderRails::VERSION

  g.add_dependency "rake", "~> 10.0.0"
end
