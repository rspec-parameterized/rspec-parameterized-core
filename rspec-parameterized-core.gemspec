# frozen_string_literal: true

require_relative "lib/rspec/parameterized/core/version"

Gem::Specification.new do |spec|
  spec.name    = "rspec-parameterized-core"
  spec.version = Rspec::Parameterized::Core::VERSION
  spec.authors = ["sue445", "tomykaira", "joker1007"]
  spec.email   = ["sue445@sue445.net", "tomykaira@gmail.com"]

  spec.description = %q{RSpec::Parameterized supports simple parameterized test syntax in rspec.}
  spec.summary     = %q{RSpec::Parameterized supports simple parameterized test syntax in rspec.
I was inspired by [udzura's mock](https://gist.github.com/1881139).}

  spec.homepage = "https://github.com/rspec-parameterized/rspec-parameterized-core"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "parser"
  spec.add_dependency "proc_to_ast"
  spec.add_dependency "rspec", ">= 2.13", "< 4"
  spec.add_dependency "unparser"

  spec.add_development_dependency "rake", ">= 12.0.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
