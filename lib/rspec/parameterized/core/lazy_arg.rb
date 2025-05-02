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
          CompositeParser.to_raw_source(@block)
        rescue ParserSyntaxError
          super.inspect
        end
      end
    end
  end
end
