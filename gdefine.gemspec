# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gdefine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James Riley"]
  gem.email         = ["james@codansa.com"]
  gem.description   = %q{Get a Google word definition from the command line}
  gem.summary       = %q{For those who live in the terminal, get a word definition without leaving the comfort of your home}
  gem.homepage      = "http://www.github.com/mrjamesriley/gdefine"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gdefine"
  gem.require_paths = ["lib"]
  gem.version       = Gdefine::VERSION

  gem.add_dependency 'nokogiri'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
