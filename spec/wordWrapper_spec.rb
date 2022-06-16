require_relative '../wordWrapper'


describe Wrapper do
  describe '#wrap' do
    subject { Wrapper.wrap(array, column) }
    let(:array) { 'word' }
    let(:column) { 6 }

    context 'single word length less than column' do
      it { should eq 'word' }
    end

    context 'multiple word greater than column' do
      let(:array) { 'word word word' }
      let(:column) { 10 }
      it { should eq("word word\nword") }
    end

    context 'when number is provided in place of string' do
      let(:array) { 1278873 }
      let(:column) { 3 }
      it { should eq "Expected String but got #{array.class}" }
    end

    context 'when 0 column provided' do
      let(:array) { 'word word' }
      let(:column) { 0 }
      it { should eq 'Provide a column atleast greater than 0' }
    end

    context 'when provided column is not a string' do
      let(:array) { 'word word' }
      let(:column) { 'col' }
      it { should eq "Expected Integer but got #{column.class}" }
    end
  end
end
