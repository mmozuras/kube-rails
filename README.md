# Kube for Rails 4 Asset Pipeline
[Kube](http://imperavi.com/kube/) is a minimal CSS-framework for developers. This projects integrates it for Rails 4 Asset Pipeline.

[![Code Climate](https://codeclimate.com/github/mmozuras/kube-rails.png)](https://codeclimate.com/github/mmozuras/kube-rails)
[![Build Status](https://secure.travis-ci.org/mmozuras/kube-rails.png)](http://travis-ci.org/mmozuras/kube-rails)
[![Gem Version](https://badge.fury.io/rb/kube-rails.png)](http://badge.fury.io/rb/kube-rails)
[![Dependency Status](https://gemnasium.com/mmozuras/kube-rails.png)](https://gemnasium.com/mmozuras/kube-rails)

## Installing Gem

Include the [Kube Rails gem](http://rubygems.org/gems/kube-rails) in Gemfile to install it from [RubyGems.org](http://rubygems.org);

```ruby
gem "kube-rails"
```

Then run ```bundle install``` from the command line.

## Using Generators

#### Install

Installs Kube to Asset Pipeline.

Usage:

    rails g kube:install

#### Themed

Generate Kube compatible scaffold views. Support for Haml and Slim is available.

Usage:

    rails g kube:themed [RESOURCE]

Example:

    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g kube:themed Posts
