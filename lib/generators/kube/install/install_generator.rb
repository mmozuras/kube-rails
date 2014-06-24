require 'rails/generators'

module Kube
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator installs Kube to Asset Pipeline'

      def add_assets
        if File.exist?('app/assets/stylesheets/application.css')
          content = File.read('app/assets/stylesheets/application.css')
          unless content.match(/require_tree\s+\.\s*$/)
            style_require_block = " *= require kube\n"
            insert_into_file 'app/assets/stylesheets/application.css', style_require_block, after: "require_self\n"
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end
      end

      def add_kube
        copy_file 'kube.less', 'app/assets/stylesheets/kube.css.less'
      end
    end
  end
end
