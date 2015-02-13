module RailsUiHarness
  module HarnessHelper
    def self.included(base)

      base.helper_method :method_missing

      def method_missing(methId, *arguments)
        str = methId.id2name
        "#[#{str} | #{arguments.inspect}]"
      end

      def base.stub_method(method, response)
        define_method(method) do |*arguments|
          "#{response}"
        end
        helper_method method
      end
    end
  end
end