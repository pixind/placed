# encoding: utf-8

require 'rails/generators'
require 'rails/generators/named_base'

module Placed
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc 'Creates Placed gem configuration file at config/placed.yml'

      def self.source_root
        @placed_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_config_file
        template 'placed.yml', File.join('config', 'placed.yml')
      end

    end
  end
end
