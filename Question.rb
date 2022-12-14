class Question
  
  attr_reader :number1, :number2, :answer, :problem
  
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = number1 + number2
  end

  def problem
    "What is #{number1} + #{number2}?"
  end

  def answer
    answer = number1 + number2
  end

  def correct?(input)
    if(input == self.answer)
        true
      else
        false
    end
  end

end


