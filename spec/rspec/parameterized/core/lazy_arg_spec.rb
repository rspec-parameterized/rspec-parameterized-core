describe RSpec::Parameterized::Core::LazyArg do
  describe "#inspect" do
    it "includes filename and line number" do
      lazy_arg = RSpec::Parameterized::Core::LazyArg.new { 1 + 2 }; expected_line = __LINE__

      expect(lazy_arg.inspect).to eq "lazy { ... } (lazy_arg_spec.rb:#{expected_line})"
    end
  end
end
