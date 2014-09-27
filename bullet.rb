class Bullet
  attr_accessor :x, :y

  def initialize(window, player, icon)
    @window = window
    @which_player = player.x
    @x = player.x
    @y = player.y
    @x_vel = 1
    @y_vel = 1
    @angle = player.angle
    @bullet_img = Gosu::Image.new(@window, icon, true)
  end

  def update
    move

  end

  def move
    if @which_player > 900
      @x -= @x_vel
    else
      @x += @x_vel
    end
    @x_vel += 0.5
  end

  def draw
    @bullet_img.draw(@x, @y, 2)
  end

  def bounds
    BoundingBox.new(@x, @y, 18, 12)
  end

  def fire(time)
    @x += @x * time
    # @y -= 1
  end

  def fire_alt
    @x -= 1
    # @y += 1
  end
end
