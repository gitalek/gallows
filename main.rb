current_path = "./#{File.dirname(__FILE__)}"

require_relative 'lib/game'
require_relative 'lib/result_printer.rb'
require_relative 'lib/word_reader.rb'

printer = ResultPrinter.new

reader = WordReader.new

word = reader.read_from_file("#{current_path}/data/words.txt")

game = Game.new(word)

while game.status.zero?
  printer.print_status(game)

  game.ask_next_letter
end

printer.print_status(game)
