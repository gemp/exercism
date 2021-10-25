class Crypto

private

  def initialize(text)
    @normalized = text.downcase.scan(/\w/)
  end

  def columns
    Math.sqrt(@normalized.size).ceil
  end

  def missing
    @normalized.size.modulo(columns)
  end

  def filling
    Array.new(columns - missing, ' ')
  end

  def cipher
    @normalized += filling unless missing.zero?
    @normalized.each_slice(columns).to_a.transpose.map(&:join)
  end

public

  def ciphertext
    return '' if @normalized.empty?
    @cipher ||= cipher.join(' ')
  end

end
