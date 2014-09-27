class Player
  attr_accessor :x, :y, :angle

  def initialize(window, x, y, icon)
    @window = window
    @x = x
    @y = y
    @angle = 0
    @move_right = false
    @move_left = false
    @icon = Gosu::Image.new(@window, icon, true)
  end

  def draw
    # @icon.draw(@x, @y, 0)
    @icon.draw_rot(@x, @y, 0, @angle, 0.1, 0.2)
  end

  def update

    if @move_right == true
      @x += 1
    end

  end

  def bounds
    BoundingBox.new(@x, @y, 40, 42)
  end

  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 0.5
    end
  end

  def move_right
    if @x == 1035
      @x = 1035
    else
      @x = @x + 0.5
    end
  end

  def rotate_up
    if @angle < 15
      @angle += 0.5
      @y -= 0.1
    end
  end

  def rotate_down
    if @angle > -45
      @angle -= 0.5
      @y += 0.1
    end
  end

  def rotate_up_alt
    if @angle < 45
      @angle += 0.5
      @y -= 0.1
      @x += 0.1
    end
  end

  def rotate_down_alt
    if @angle > -15
      @angle -= 0.5
      @y += 0.1
      @x -= 0.1
    end
  end
end
