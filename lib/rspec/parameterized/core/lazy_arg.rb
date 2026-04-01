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
          filename, linenum = @block.source_location
          "lazy { ... } (#{File.basename(filename)}:#{linenum})"
        end
      end
    end
  end
end
