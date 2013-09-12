class BowlingGame
  attr_reader :rolls
  def initialize
    @rolls = []
    @total_score = 0
    @current_roll = 0
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    while @current_roll < @rolls.size - 1
      init_roll
      if strike?
       score_strike
      elsif spare?
        score_spare
      else
        score_else
      end
    end
    return @total_score
  end

  private

  def init_roll
    @roll = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll+1]
  end

  def strike?
    @roll ==10
  end

  def score_strike
    @total_score +=10 + @rolls[@current_roll +1] + @rolls[@current_roll + 2]
    @current_roll +=1
  end

  def spare?
    @roll + @next_roll == 10
  end

  def score_spare
    @total_score = 10 + @rolls[@current_roll + 2]
    @current_roll += 2 
  end

  def score_else
    @total_score += @roll + @next_roll
    @current_roll += 2
  end
end
