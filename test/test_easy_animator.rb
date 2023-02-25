# frozen_string_literal: true

require "test_helper"
require_relative "../lib/easy_animator"

class TestEasyAnimator < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EasyAnimator::VERSION
  end

  def test_starts_immediately_without_offset
    animator = Animator.new(starting: 0, ending: 5, duration: 5)
    animator.start
    assert animator.started?
  end

  def test_does_not_immediately_with_offset
    animator = Animator.new(starting: 0, ending: 5, duration: 5, easing: :linear, start_offset: 100)
    animator.start
    refute animator.started?, "Should not start until after offset."
  end

  def test_does_not_start_until_called
    animator = Animator.new(starting: 0, ending: 5, duration: 5)
    refute animator.started?, "started? should be false"
    refute animator.ended?, "ended? should be false"
    assert animator.value == 0, "value should be 0"
  end
end
