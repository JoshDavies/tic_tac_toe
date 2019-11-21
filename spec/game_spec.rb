# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }
  
  describe '#player_move' do
    it 'allows player1 to enter their move' do
      expect(game.player_move(1)).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
