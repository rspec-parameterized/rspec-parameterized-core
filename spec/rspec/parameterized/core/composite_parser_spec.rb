describe RSpec::Parameterized::Core::CompositeParser do
  describe ".to_raw_source" do
    subject { RSpec::Parameterized::Core::CompositeParser.to_raw_source(arg) }

    context "arg is not proc" do
      let(:arg) do
        123
      end

      it { should eq "123" }
    end

    context "arg is proc" do
      context "simple case" do
        let(:arg) do
          ->(a) { a + 1 }
        end

        it { should eq "->(a) { a + 1 }" }
        its(:encoding) { should eq Encoding::UTF_8 }
      end

      context "arg is multibyte characters" do
        let(:arg) do
          ->(a) { a + "ほげほげ" }
        end

        it { should eq '->(a) { a + "ほげほげ" }' }
        its(:encoding) { should eq Encoding::UTF_8 }
      end
    end
  end
end
