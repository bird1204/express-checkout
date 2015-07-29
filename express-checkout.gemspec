# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'express/version'

Gem::Specification.new do |spec|
  spec.name          = "express-checkout"
  spec.version       = Express::VERSION
  spec.authors       = ["Wei-Yi Chiu"]
  spec.email         = ["bird1204@gmail.com"]

  spec.summary       = %q{papal express-checkout gem}
  spec.description   = %q{papal express-checkout gem}
  spec.homepage      = "https://github.com/bird1204"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 2.3"
  spec.add_dependency "rest-client"
  spec.add_dependency "attr_required", ">= 0.0.5"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", ">= 0.8"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec", "< 2.99"
  spec.add_development_dependency "fakeweb", ">= 1.3.0"
end
