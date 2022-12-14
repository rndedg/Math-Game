class Player

  attr_accessor :lives, :name
  
  def initialize
    @name = nil
    @lives = 3
  end
  
  def alive?
    @lives > 0
  end


end
