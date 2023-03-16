module Easings
  def linear(t, b, c, d)
    puts(c * t / d + b)
  end

  def in_quad(t, b, c, d)
    t /= d
    c * (t**2) + b
  end

  def out_quad(t, b, c, d)
    t /= d
    -c * t * (t - 2) + b
  end

  def in_out_quad(t, b, c, d)
    t /= d * 2
    if t < 1
      c / 2 * (t**2) + b
    else
      -c / 2 * ((t - 1) * (t - 3) - 1) + b
    end
  end

  def in_cubic(t, b, c, d)
    t /= d
    c * (t**3) + b
  end

  def out_cubic(t, b, c, d)
    t /= d - 1
    c * (t**3 + 1) + b
  end

  def in_out_cubic(t, b, c, d)
    t /= d / 2
    if t < 1
      c / 2 * (t**3) + b
    else
      t -= 2
      c / 2 * (t**3 + 2) + b
    end
  end
end
