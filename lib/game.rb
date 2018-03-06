# class documentation
class Game
  attr_reader :letters, :errors, :good_letters, :bad_letters, :status

  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(word)
    if [nil, ''].include?(word)
      abort 'Для игры введите загаданное слово в качестве аргумента при ' \
        'запуске программы'
    end

    word.split('').map(&:downcase)
  end

  def next_step(letter)
    return if [-1, 1].include?(status)

    return if good_letters.include?(letter) || bad_letters.include?(letter)

    if @letters.include?(letter)
      @good_letters << letter

      @status = 1 if @good_letters.uniq.sort == @letters.uniq.sort
    else
      @bad_letters << letter
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
