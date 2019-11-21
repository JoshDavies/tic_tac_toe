# frozen_string_literal: true

class Game
  def initialize
    @fields = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_turn = 'X'
  end

  attr_reader :fields, :current_turn

  def player_move(move)
    @fields[move - 1] = current_turn
    end_turn
  end

  private
  def end_turn
    if @current_turn == 'X'
      @current_turn = 'O'
    else
      @current_turn = 'X'
    end
  end
end
