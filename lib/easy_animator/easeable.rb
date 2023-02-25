module Easeable
  # Calculate current value for a linear animation curve
  # @param t [Numeric] elapsed time
  # @param b [Numeric] the beginning value
  # @param c [Numeric] the change in value
  # @param d [Numeric] the total duration
  def linear(t, b, c, d)
    c * t / d + b
  end
end
