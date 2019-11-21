# frozen_string_literal: true

class Game
  def initialize
    @fields = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_turn = 'player1'
  end

  attr_reader :fields, :current_turn

  def player_move(move)
    if @current_turn == 'player1'
      @fields[move - 1] = 'X'
    else
      @fields[move - 1] = 'O'
    end
    end_turn
  end

  private
  def end_turn
    @current_turn = 'player2'
  end
end



game = Game.new
game.player_move(5)
p game.fields
