module Kube
  module Rails
    require 'kube/rails/engine' if defined?(Rails)
  end
end

require 'less-rails'
require 'kube/rails/kube' if defined?(Rails)
