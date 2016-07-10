require 'spec_helper'

require 'obfuscator'

describe Obfuscator do
  describe '#secret' do
    subject { obfuscator.secret }

    let(:obfuscator) { described_class.new message }

    context 'when message is a single dot' do
      let(:message) { '.' }
      it 'converts it to the dot count' do
         expect(subject).to eq '1'
      end
    end

    context 'when message is 3 dashes' do
      let(:message) { '---' }
      it 'converts to a char whos alphabet-index matches the dash count' do
         expect(subject).to eq 'c'
      end
    end

    context 'when message empty' do
      let(:message) { '' }
      it 'does no conversion' do
         expect(subject).to eq ''
      end
    end

    context 'when message is not a dot or dash' do
      let(:message) { 'AAA' }
      it 'does no conversion' do
         expect(subject).to eq 'AAA'
      end
    end

    context 'when message is like a real message' do
      let(:message) { '...---|..--/.-' }
      it { is_expected.to eq '3c|2b/1a' }
    end
  end
end
