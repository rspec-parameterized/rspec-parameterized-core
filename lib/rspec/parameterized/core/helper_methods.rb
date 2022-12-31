require 'rspec/parameterized/core/ref_arg'
require 'rspec/parameterized/core/lazy_arg'
module RSpec
  module Parameterized
    module Core
      module HelperMethods
        def ref(symbol)
          RefArg.new(symbol)
        end

        def lazy(&block)
          LazyArg.new(&block)
        end

        def self.applicable?(arg)
          arg.is_a? Arg
        end
      end
    end
  end
end
