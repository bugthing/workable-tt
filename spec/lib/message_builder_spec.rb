require 'spec_helper'

require 'message_builder'

describe MessageBuilder do
  let(:builder) { described_class.new str }
  let(:str) { "Hi Jim\nbye" }

  describe '#message' do
    subject { builder.message }

    it 'uses | between characters' do
      expect(subject.scan('|').count).to eq 5
    end

    it 'uses / between words' do
      expect(subject.scan('/').count).to eq 1
    end

    it 'does not alter new lines' do
      expect(subject.scan("\n").count).to eq 1
    end

    it 'converts the message to morse code' do
      expect(subject).to eq "....|../.---|..|--\n-...|-.--|."
    end

    context 'source string contains non-alphanumeric' do
      let(:str) { "Hi Jim\nbye!" }
      specify { expect { subject }.to raise_exception ArgumentError }
    end
  end
end
