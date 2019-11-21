# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#player_move' do
    it 'allows player1 to enter their move' do
      game.player_move(1)
      expect(game.fields).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end
    it 'allows player1 to enter their move in any field' do
      game.player_move(4)
      expect(game.fields).to eq([1, 2, 3, 'X', 5, 6, 7, 8, 9])
    end
    it 'allows player2 to enter their move in any available field' do
      game.player_move(5)
      game.player_move(2)
      expect(game.fields).to eq([1, 'O', 3, 4, 'X', 6, 7, 8, 9])
    end
    it 'allows player1 to enter their second move in any available field' do
      game.player_move(5)
      game.player_move(2)
      game.player_move(4)
      expect(game.fields).to eq([1, 'O', 3, 'X', 'X', 6, 7, 8, 9])
    end
  end
end
