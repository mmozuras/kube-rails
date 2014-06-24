# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'kube/rails/version'

Gem::Specification.new do |s|
  s.name        = 'kube-rails'
  s.version     = Kube::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Mindaugas Mozūras']
  s.email       = ['mindaugas.mozuras@gmail.com']
  s.homepage    = 'https://github.com/mmozuras/kube-rails'
  s.summary     = 'Kube for Rails 3.1 Asset Pipeline'
  s.description = <<-EOF
    kube-rails project integrates Kube for Rails 3.1 Asset Pipeline
  EOF
  s.license     = 'MIT'

  s.rubyforge_project = 'kube-rails'
  s.files = Dir['lib/**/*'] + Dir['vendor/**/*'] + ['Rakefile', 'README.md']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'railties', '~> 3.1'
  s.add_runtime_dependency 'actionpack', '~> 3.1'

  s.add_runtime_dependency 'less-rails', '~> 2.4', '>= 2.4.0'
  s.add_development_dependency 'rails', '~> 3.1'
end
