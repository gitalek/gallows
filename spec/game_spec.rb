require 'rspec'
require_relative '../lib/game'

describe 'game' do

  it 'testing win flow' do
    game = Game.new('ruby')

    expect(game.status).to equal(0)

    %w[y a v r r b u].each do |letter|
      game.next_step(letter)
    end

    expect(game.status).to equal(1)
    expect(game.errors).to equal(2)
    expect(game.good_letters).to match_array(%w[r u b y])
    expect(game.bad_letters).to match_array(%w[a v])
  end

  it 'testing loss flow' do
    game = Game.new('happiness')

    expect(game.status).to equal(0)

    %w[a p r b b i u t l o k].each do |letter|
      game.next_step(letter)
    end

    expect(game.status).to equal(-1)
    expect(game.errors).to equal(7)
    expect(game.good_letters).to match_array(%w[a p i])
    expect(game.bad_letters).to match_array(%w[r b u t l o k])
  end
end