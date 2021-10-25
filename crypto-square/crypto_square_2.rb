class Crypto

private

  attr_reader :text

  def initialize(text)
    @text = text.downcase.gsub(/\W/, '').freeze
  end

  def cipher
    cols = Math.sqrt(text.size).ceil
    text.scan(/.{1,#{cols}}/).map { |s| s.ljust(cols).chars }.transpose
  end

public

  def ciphertext
    return text if text.empty?
    @cipher ||= cipher.map(&:join).join(' ')
  end

end