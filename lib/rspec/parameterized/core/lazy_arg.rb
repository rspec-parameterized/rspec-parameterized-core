module RSpec
  module Parameterized
    module Core
      class LazyArg < Arg
        def initialize(&block)
          @block = block
        end

        def apply(obj)
          obj.instance_eval(&@block)
        end

        def inspect
          return super.inspect unless @block.respond_to?(:to_raw_source)

          "#{@block.to_raw_source}"
        rescue Parser::SyntaxError
          super.inspect
        end
      end
    end
  end
end
