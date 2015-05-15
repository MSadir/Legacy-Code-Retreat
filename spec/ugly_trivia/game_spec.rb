require 'ugly_trivia/game'
require 'spec_helper'

describe UglyTrivia::Game do

  describe '#was_correctly_answered' do

    before do
      subject.add 'Chet'
      subject.roll 5
    end

    it 'gives the player a coin if they are not in the penalty box' do
      subject.was_correctly_answered
      expect(subject.purses.first).to eq 1
    end

    it 'returns false if the player has then won the game' do
      5.times do
        subject.was_correctly_answered
      end
      expect(subject.was_correctly_answered).to eq(false)
    end

    it 'returns true if the player has not then won the game' do
      4.times do
        subject.was_correctly_answered
      end
      expect(subject.was_correctly_answered).to eq(true)
    end

    it 'moves on to the next player' do
      subject.add 'Bob'
      subject.was_correctly_answered
      expect(subject.current_player).to eq 1
    end
  end
end
