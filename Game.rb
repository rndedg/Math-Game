class Game

  attr_accessor :player1, :player2, :current_player
  attr_reader :question

  def initialize
    @player1 = Player.new
    puts "Player 1, please enter your name:"
    player1.name = gets.chomp.to_s
    @player2 = Player.new
    puts"Player 2, please enter your name:"
    player2.name = gets.chomp.to_s

    @current_player = @player1

    self.start
  end

  def start
    puts "Welcome to the Math Game. Good luck everyone!"

    puts "
    Ok, #{player1.name} and #{player2.name}, here we go.
    *************************"
    game_round
  end

  def switch_player(current_player)
    self.current_player = case current_player
                            when player1 then player2
                            when player2 then player1
                          end
  end



  def game_over
    switch_player(current_player)
    puts "Game over #{self.current_player.name} wins!
    *************************
    Good job everyone, hope you had a good time!
    *************************"
  end

  def game_round
    question = Question.new

    puts question.problem
    input = gets.chomp.to_i

      if question.correct?(input) == true
        print "Good job #{current_player.name}, that is correct!"
      else 
        puts "Sorry #{current_player.name}, that is incorrect."
        current_player.lives -= 1
        puts "#{current_player.name}, you have #{current_player.lives} left."
      end

      if current_player.alive? == false
        self.game_over
      else
        switch_player(current_player)
        puts"
        P1: #{player1.lives}/3 vs. #{player2.lives}/3
        "
        puts "
        *************************
        Next round, here we go...
        *************************"
        game_round
      end
    end
end

