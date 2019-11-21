# frozen_string_literal: true

class Game
  def initialize(fields: [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @fields = fields
    @current_turn = 'X'
  end

  attr_reader :fields, :current_turn

  def player_move(move)
    return 'Field already taken' unless field_available?(move)
    update_field(move)
    return 'Draw' if draw?
    end_turn
  end

  def draw?
    return false if @fields.any? Numeric
    true
  end

  def end_turn
    if @current_turn == 'X'
      @current_turn = 'O'
    else
      @current_turn = 'X'
    end
  end

  def field_available?(move)
     @fields[move - 1].is_a? Numeric
  end

  def update_field(move)
    @fields[move - 1] = current_turn
  end

  def player_wins?
    return current_turn + ' wins!' if three_in_a_row?(0, 1, 2)
    return current_turn + ' wins!' if three_in_a_row?(3, 4, 5)
    return current_turn + ' wins!' if three_in_a_row?(6, 7, 8)
  end

  def three_in_a_row?(a, b, c)
    return @fields.values_at(a, b, c).uniq.count == 1
  end
end
