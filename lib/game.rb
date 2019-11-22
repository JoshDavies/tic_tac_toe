# frozen_string_literal: true

class Game
  def initialize(fields: [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @fields = fields
    @current_turn = 'X'
    @message = 'Player X make your move'
  end

  attr_reader :fields, :current_turn

  def player_move(move)
    return 'Field already taken' unless field_available?(move)
    update_field(move)
    player_wins?
    return 'Draw' if draw?
    end_turn
  end

  def draw?
    return false if fields.any? Numeric
    true
  end

  def end_turn
    current_turn == 'X' ? (@current_turn = 'O') : (@current_turn = 'X')
    @message = 'Player ' + current_turn + ' make your move'
  end

  def field_available?(move)
     fields[move - 1].is_a? Numeric
  end

  def update_field(move)
    fields[move - 1] = current_turn
  end

  def player_wins?
    victory_conditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    victory_conditions.each{ |condition|
      return current_turn + ' wins!' if three_in_a_row?(condition)
    }
  end

  def three_in_a_row?(condition)
    a = condition[0]
    b = condition[1]
    c = condition[2]
    return fields.values_at(a, b, c).uniq.count == 1
  end
end

game = Game.new
game.player_move(1)
game.player_move(2)
game.player_move(4)
game.player_move(9)
p game.player_move(7)
p game.player_wins?
