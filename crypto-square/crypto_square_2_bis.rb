class Crypto

private

  attr_reader :text

  def initialize(text)
    @text = text.downcase.gsub(/\W/, '').freeze
  end

  def cipher
    cols = Math.sqrt(text.size).ceil
    miss = text.size.modulo(cols) #avoid ljust on every string (comment)
    adjusted = miss.zero? ? text : text + ' ' * (cols - miss)
    adjusted.scan(/.{1,#{cols}}/).map(&:chars).transpose
  end

public

  def ciphertext
    return text if text.empty?
    @cipher ||= cipher.map(&:join).join(' ')
  end

end