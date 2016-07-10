class Obfuscator
  def initialize(message)
    @message = message
  end

  def secret
    replace('.') { |f| f.length.to_s }
    replace('-') { |f| (f.length + 96).chr }
    message
  end

  private

  attr_reader :message

  def replace(char)
    while matches = message.match(/(#{Regexp.escape(char)}+)/)
      message.sub!(matches[1], yield(matches[1]))
    end
  end
end
