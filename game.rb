require 'gosu'
require 'pry'
require 'date'
require_relative 'player'
require_relative 'bullet'
require_relative 'bounding_box'
require_relative 'timer'

class GameWindow < Gosu::Window
  SCREEN_WIDTH = 1072
  SCREEN_HEIGHT = 720

  attr_accessor :player1, :width

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "TankBound"
    @player1 = Player.new(self, 10, SCREEN_HEIGHT - 50, "img/boy.png")
    @player2 = Player.new(self, SCREEN_WIDTH - 50, SCREEN_HEIGHT - 50, "img/girl.png")
    @bg_img = Gosu::Image.new(self, 'img/bg.jpg', true)
    @bullets = []
    @bullets1 = []
    @bullets2 = []
  end

  def update

    @bullets.each do |bullet|
      bullet.update
    end

    if button_down? Gosu::Button::KbA
      @player1.move_left
    end

    if button_down? Gosu::Button::KbD
      @player1.move_right
    end

    if button_down? Gosu::Button::KbLeft
      @player2.move_left
    end

    if button_down? Gosu::Button::KbRight
      @player2.move_right
    end

    if button_down? Gosu::Button::KbW
      @player1.rotate_up
    end

    if button_down? Gosu::Button::KbS
      @player1.rotate_down
    end

    if button_down? Gosu::Button::KbUp
      @player2.rotate_up_alt
    end

    if button_down? Gosu::Button::KbDown
      @player2.rotate_down_alt
    end

    if button_down? Gosu::Button::KbSpace
      @time = Timer.new
      @bullet1 = Bullet.new(self, @player1, @time, "img/bullet1.png")
      @bullets1 << @bullet1
      @bullets << @bullet1
    end

    if button_down? Gosu::Button::KbRightShift
      @time = Timer.new
      @bullet2 = Bullet.new(self, @player2, @time, "img/bullet2.png")
      @bullets2 << @bullet2
      @bullets << @bullet2
    end

    @bullets2.each do |bullet|
      if @player1.hit_by?(bullet)
        @player1.minus_health
      end
    end

    @bullets1.each do |bullet|
      if @player2.hit_by?(bullet)
        @player2.minus_health
      end
    end
  end

  def draw
    @bg_img.draw(0, 0, 0)
    @player1.draw
    @player2.draw
    @bullets.each do |bullet|
      bullet.draw
    end
  end

end

GameWindow.new.show
