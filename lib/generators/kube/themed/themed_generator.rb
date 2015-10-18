require 'rails/generators'
require 'rails/generators/generated_attribute'

module Kube
  module Generators
    class ThemedGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :controller_path, type: :string
      argument :model_name, type: :string, required: false
      argument :layout, type: :string, default: 'application',
                        banner: 'Specify application layout'

      def initialize(args, *options)
        super(args, *options)
        initialize_views_variables
      end

      def copy_views
        generate_views
      end

      protected

      def initialize_views_variables
        @base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(controller_path)
        @controller_routing_path = @controller_file_path.gsub(/\//, '_')
        @model_name = @controller_class_nesting + "::#{@base_name.singularize.camelize}" unless @model_name
        @model_name = @model_name.camelize
      end

      attr_reader :controller_routing_path

      def singular_controller_routing_path
        @controller_routing_path.singularize
      end

      def model_class
        resource_name.classify
      end

      def resource_name
        @model_name.demodulize.underscore
      end

      def plural_resource_name
        resource_name.pluralize
      end

      def columns
        begin
          model_columns.map do |c|
            ::Rails::Generators::GeneratedAttribute.new(c.name, c.type)
          end
        rescue ActiveRecord::StatementInvalid => e
          say e.message, :red
          exit
        end
      rescue NoMethodError
        model_fields.map do |c|
          ::Rails::Generators::GeneratedAttribute.new(c.name, c.type.to_s)
        end
      end

      def model_columns
        exclude(@model_name.constantize.columns)
      end

      def model_fields
        exclude(@model_name.constantize.fields.map { |c| c[1] })
      end

      def exclude(columns)
        excluded_column_names = %w(id created_at updated_at)
        columns.reject { |c| excluded_column_names.include?(c.name) }
      end

      def extract_modules(name)
        modules = name.include?('/') ? name.split('/') : name.split('::')
        name = modules.pop
        path = modules.map(&:underscore)
        file_path = (path + [name.underscore]).join('/')
        nesting = modules.map(&:camelize).join('::')
        [name, path, file_path, nesting, modules.size]
      end

      def generate_views
        views = {
          "index.html.#{ext}" => view_path("index.html.#{ext}"),
          "new.html.#{ext}" => view_path("new.html.#{ext}"),
          "edit.html.#{ext}" => view_path("edit.html.#{ext}"),
          "_form.html.#{ext}" => view_path("_form.html.#{ext}"),
          "show.html.#{ext}" => view_path("show.html.#{ext}") }
        selected_views = views
        options.engine == generate_templates(selected_views)
      end

      def generate_templates(views)
        views.each do |template_name, output_path|
          template template_name, output_path
        end
      end

      def ext
        ::Rails.application.config.generators.options[:rails][:template_engine] || :erb
      end

      def view_path(name)
        File.join('app/views', @controller_file_path, name)
      end
    end
  end
end
