require_relative "easeable"

class Animator
  include Easeable

  def initialize(starting:, ending:, duration:, easing: :linear, start_offset: 0)
    @duration = duration
    @starting = starting
    @start_offset = start_offset
    @ending = ending
    @easing = method(easing)
    @start_time = nil
  end

  def start
    @start_time = Time.now
  end

  # Percent complete of the animation (0.0 to 1.0)
  def progress
    return 1.0 if ended?
    return 0.0 unless started?
    (Time.now - @start_time - @start_offset) / @duration
  end

  # Current value between starting and ending
  def value
    return @ending if ended?
    return @starting unless started?
    @easing.call(elapsed_time, starting, ending, duration)
  end

  # @returns [Float]
  def elapsed_time
    return duration if ended?
  end

  # @returns [Boolean]
  def started?
    return false unless @start_time
    Time.now - @start_time >= @start_offset
  end

  # @returns [Boolean]
  def ended?
    return false unless @start_time
    Time.now - @start_time >= @duration
  end
end
