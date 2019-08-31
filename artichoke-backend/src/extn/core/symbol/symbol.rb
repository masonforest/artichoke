# frozen_string_literal: true

class Symbol
  include Comparable

  def <=>(other)
    return nil unless other.is_a?(Symbol)

    to_s <=> other.to_s
  end

  def capitalize
    (to_s.capitalize! || self).to_sym
  end

  def downcase
    (to_s.downcase! || self).to_sym
  end

  def upcase
    (to_s.upcase! || self).to_sym
  end

  def casecmp(other)
    return nil unless other.is_a?(Symbol)

    lhs = to_s
    lhs.upcase!
    rhs = other.to_s.upcase
    lhs <=> rhs
  end

  def casecmp?(sym)
    c = casecmp(sym)
    return nil if c.nil?

    c.zero?
  end

  def empty?
    to_s.empty?
  end

  def length
    to_s.length
  end

  alias size length
  alias intern to_sym
end
