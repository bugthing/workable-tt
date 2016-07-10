require 'spec_helper'

require 'morse_code'

describe MorseCode do
  describe '.alpha_to_code' do
    subject { described_class.alpha_to_code alpha }
    let(:alpha) { 'A' }
    it { is_expected.to eq '.-' }

    context 'using lower case letter' do
      let(:alpha) { 'a' }
      it { is_expected.to eq '.-' }
    end

    context 'using an unkown char' do
      let(:alpha) { '/' }
      it { is_expected.to be nil }
    end
  end

  describe '.code_to_alpha' do
    subject { described_class.code_to_alpha code }
    let(:code) { '.-' }
    it { is_expected.to eq 'A' }
  end
end
