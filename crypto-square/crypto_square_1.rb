class Crypto

private

  attr_reader :text

  def initialize(text)
    @text = text.downcase.scan(/\w/).freeze
  end

  def cipher
    return text if text.empty?
    chars = Math.sqrt(text.size).ceil
    length = chars * (text.size / chars.to_f).ceil
    (0...chars).map do |start|
      (start...length).step(chars).map { |i| text.fetch(i, ' ') }.join
    end
  end

public

  def ciphertext
    cipher.join(' ')
  end

end