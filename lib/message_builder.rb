require_relative 'morse_code'

class MessageBuilder
  def initialize(string)
    @string = string
  end

  def message
    string.each_line.map do |line|
      line.split(/\s+/).map do |word|
        word.each_char.map do |char|
          encode(char)
        end.join('|')
      end.join('/')
    end.join("\n")
  end

  private

  attr_reader :string

  def encode(char)
    MorseCode.alpha_to_code(char) || fail(ArgumentError)
  end
end
