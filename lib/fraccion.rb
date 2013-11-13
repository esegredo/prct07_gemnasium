require 'gcd'

class Fraccion

  include Comparable

  attr_accessor :num, :denom

  def initialize(num, denom)
    @num = num.abs / gcd(num, denom)
    @denom = denom.abs / gcd(num, denom)
    @num = -@num if ((num.to_f / denom.to_f) < 0)
  end

  def to_s
    "#{@num}/#{@denom}"
  end

  def to_f
    @num.to_f/@denom.to_f
  end

  def abs
    Fraccion.new(@num.abs, @denom)
  end

  def reciprocal
    Fraccion.new(@denom, @num)
  end

  def -@
    Fraccion.new(-@num, @denom)
  end

  def +(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    Fraccion.new(@num * other.denom + @denom * other.num, @denom * other.denom);
  end

  def -(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    Fraccion.new(@num * other.denom - @denom * other.num, @denom * other.denom);
  end

  def *(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    Fraccion.new(@num * other.num, @denom * other.denom)
  end

  def /(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    Fraccion.new(@num * other.denom, @denom * other.num)
  end

  def %(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    result = self / other
    result - Fraccion.new(result.to_f.truncate, 1)
  end

  def <=>(other)
    other = Fraccion.new(other, 1) if other.is_a? Integer
    return nil unless (other.instance_of? Fraccion)
    self.to_f <=> other.to_f
  end

  def coerce(other)
    [Fraccion.new(other, 1), self] if other.is_a? Integer
  end

end
