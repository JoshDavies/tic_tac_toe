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
    it 'ends a players turn after they have claimed a field' do
      game.player_move(3)
      expect(game.current_turn).to eq('O')
      game.player_move(7)
      expect(game.current_turn).to eq('X')
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
    it 'does not allow a player to pick a field that is already taken' do
      game.player_move(9)
      expect(game.player_move(9)).to eq('Field already taken')
      expect(game.current_turn).to eq('O')
    end
  end

  describe '#draw?' do
    it 'allows a game to end in a draw' do
      DRAW_GAME = ['X', 'O', 'X', 'X', 'O', 'O', 'O', 'X', 'X']
      draw_game = Game.new(fields: DRAW_GAME)
      expect(draw_game.draw?).to eq(true)
    end
  end

  describe '#end_turn' do
    it 'allows a game to end in a draw' do
      game.end_turn
      expect(game.current_turn).to eq('O')
    end
  end

  describe '#update_field' do
    it 'updates the chosen field with a players move' do
      game.update_field(1)
      expect(game.fields).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#field_available?' do
    it 'checks if the chosen fields has already been taken' do
      TEST_GAME = ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      test_game = Game.new(fields: TEST_GAME)
      expect(test_game.field_available?(1)).to eq(false)
      expect(test_game.field_available?(2)).to eq(true)
    end
  end
end
