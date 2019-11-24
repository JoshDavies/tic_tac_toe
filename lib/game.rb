# frozen_string_literal: true

class Game
  def initialize(fields: [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @fields = fields
    @current_turn = 'X'
    @message = 'Player X make your move'
  end

  def player_move(move)
    return if field_unavailable?(move)
    update_field(move)
    # return if player_wins?
    return 'Draw' if draw?
    end_turn
  end

  def draw?
    return false if @fields.any? Numeric
    true
  end

  def end_turn
    @current_turn == 'X' ? (@current_turn = 'O') : (@current_turn = 'X')
  end

  def field_unavailable?(move)
    return false if fields[move - 1].is_a? Numeric
    true
  end

  def update_field(move)
    @fields[move - 1] = @current_turn
    @fields
  end

  def player_wins?
    victory_conditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    victory_conditions.each{ |condition|
      return @current_turn + ' wins!' if three_in_a_row?(condition)
    }
  end

  def three_in_a_row?(condition)
    a = condition[0]
    b = condition[1]
    c = condition[2]
    return @fields.values_at(a, b, c).uniq.count == 1
  end
end
