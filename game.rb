# class documentation
class Game
  attr_reader :letters, :errors, :good_letters, :bad_letters, :status

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    if [nil, ''].include?(slovo)
      abort 'Для игры введите загаданное слово в качестве аргумента при ' \
        'запуске программы'
    end

    slovo.split('').map(&:downcase)
  end

  def next_step(bukva)
    return if [-1, 1].include?(status)

    return if good_letters.include?(bukva) || bad_letters.include?(bukva)

    if @letters.include?(bukva)
      @good_letters << bukva

      @status = 1 if @good_letters.uniq.sort == @letters.uniq.sort
    else
      @bad_letters << bukva
      @errors += 1

      @status = -1 if @errors >= 7
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ''
    letter = STDIN.gets.chomp.downcase while letter == ''
    puts letter

    next_step(letter)
  end
end
