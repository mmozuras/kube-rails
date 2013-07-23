# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kube/rails/version"

Gem::Specification.new do |s|
  s.name        = "kube-rails"
  s.version     = Kube::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mindaugas Mozūras"]
  s.email       = ["mindaugas.mozuras@gmail.com"]
  s.homepage    = "https://github.com/mmozuras/kube-rails"
  s.summary     = %q{Kube for Rails 3.1 Asset Pipeline}
  s.description = %q{kube-rails project integrates Kube for Rails 3.1 Asset Pipeline}
  s.license     = 'MIT'

  s.rubyforge_project = "kube-rails"
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'railties',   '>= 3.1'
  s.add_dependency 'actionpack', '>= 3.1'

  if (RUBY_PLATFORM == 'java')
    s.add_dependency 'therubyrhino', '~> 1.73.4'
  else
    s.add_dependency 'therubyracer', '>= 0.10.2'
  end

  s.add_runtime_dependency     'less-rails', '~> 2.3.0'
  s.add_development_dependency 'rails', '>= 3.1'
end
