class Bullet
  attr_accessor :x, :y

  def initialize(window, player, time, icon)
    @window = window
    @which_player = player.x
    @x = player.x
    @y = player.y
    @x_vel = 0.1
    @y_vel = 0.1
    @x_acc = 100
    @y_acc = 10
    @weight = 0.5
    @angle = player.angle
    @time = time
    # binding.pry
    @bullet_img = Gosu::Image.new(@window, icon, true)
  end

  def update
    move

  end

  def move
    if @which_player > 900
      @x -= @x_vel * Math.cos(-@angle * (Math::PI / 180)) * @x / @x_acc
      if @angle > 0
          @y += -(0.5 * @y_acc + @y_vel * Math.sin(-@angle * (Math::PI / 180)))
      end
    else
      @x += @x_vel * Math.cos(@angle * (Math::PI / 180)) * @x / @x_acc
      if @angle < 0
          @y += -(0.5 * @y_acc + @y_vel * Math.sin(@angle * (Math::PI / 180)))
      end
    end

    @x_acc += 5
    @y_acc -= 0.25 * @weight
    @x_vel += 0.1
    @y_vel -= 0.1
    @weight += 0.0025
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
