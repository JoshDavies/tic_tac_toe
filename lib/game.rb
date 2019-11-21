# frozen_string_literal: true

class Game
  def initialize
    @fields = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  attr_reader :fields

  def player_move(move)
    @fields[move - 1] = 'X'
  end
end



game = Game.new
game.player_move(5)
p game.fields
