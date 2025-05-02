module RSpec
  module Parameterized
    module Core
      # Proxy class for parser and prism
      module CompositeParser
        # @param obj [Object]
        # @return [String]
        # @raise [RSpec::Parameterized::Core::ParserSyntaxError]
        def self.to_raw_source(obj)
          return to_raw_source_with_prism(obj) if use_prism?

          to_raw_source_with_parser(obj)
        end

        # Whether use parser or prism
        #
        # @return [true] Use prism
        # @return [false] Use parser
        def self.use_prism?
          Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.4.0")
        end

        # @param obj [Object]
        # @return [String]
        # @raise [RSpec::Parameterized::Core::ParserSyntaxError]
        def self.to_raw_source_with_parser(obj)
          obj.is_a?(Proc) ? obj.to_raw_source : obj.inspect
        rescue Parser::SyntaxError => e
          raise ParserSyntaxError
        end
        private_class_method :to_raw_source_with_parser

        # @param obj [Object]
        # @return [String]
        def self.to_raw_source_with_prism(obj)
          # TODO: Impl
          raise "TODO: Impl"
        end
        private_class_method :to_raw_source_with_prism
      end
    end
  end
end

if RSpec::Parameterized::Core::CompositeParser.use_prism?
  require 'prism'
else
  require 'parser'
  require 'unparser'
  require 'proc_to_ast'
end
