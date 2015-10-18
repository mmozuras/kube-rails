require 'rails'

module Kube
  module Rails
    class Engine < ::Rails::Engine
      initializer 'kube-rails.setup',
                  after: 'less-rails.after.load_config_initializers',
                  group: :all do |app|
        app.config.less.paths << File.join(config.root, 'vendor')
      end
    end
  end
end
