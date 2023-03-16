require_relative "easings"

class Animator
  include Easings

  def initialize(starting:, ending:, duration:, easing: :linear)
    @duration = duration.to_f
    @starting = starting.to_f
    @ending = ending.to_f
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
    (Time.now - @start_time) / @duration
  end

  # Current value between starting and ending
  def value
    return @ending if ended?
    return @starting unless started?
    @easing.call(elapsed_time, @starting, @ending - @starting, @duration)
  end

  # @returns [Float]
  def elapsed_time
    return duration if ended?
    return 0.0 unless started?
    Time.now - @start_time
  end

  # @returns [Boolean]
  def started?
    !@start_time.nil?
  end

  # @returns [Boolean]
  def ended?
    return false unless @start_time
    Time.now - @start_time >= @duration
  end
end
