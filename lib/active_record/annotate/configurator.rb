module ActiveRecord
  module Annotate
    class Configurator
      BOOLEAN_ATTRIBUTES = %w(yard debug)

      BOOLEAN_ATTRIBUTES.each do |setting|
        attr_accessor setting
        alias_method "#{setting}?", setting
      end

      attr_accessor :ignored_models
      def annotate_ignore=(models)
        if models.is_a?(Array)
          @ignored_models = models
        else
          raise "ActiveRecord::Annotate.config.ignored_models must be an Array of model classes"
        end
      end

      def initialize
        reset
      end

    private

      def reset
        BOOLEAN_ATTRIBUTES.each do |attr|
          instance_variable_set("@#{attr}", false)
        end

        @annotate_ignore = []
      end

    end
  end
end
