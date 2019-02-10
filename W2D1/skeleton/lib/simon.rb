class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    
  end

  def play
    until game_over
      take_turn
      # p 'hello'
    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      user_input = require_sequence
      
      if user_input != seq 
        @game_over= true 
      else
        round_success_message
      end
      round_success_message

      @sequence_length  += 1
  end

  def show_sequence
    add_random_color
    puts seq 
    sleep 1
    system('clear')
  end

  def require_sequence
    puts 'type your sequence i.e. (red, blue, green) '
    gets.chomp.split(', ') 
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts 'congrats! moving on to next round.'
  end

  def game_over_message
    puts 'you lost the game!'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

# simon = Simon.new
# simon.play