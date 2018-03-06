# class documentation
class ResultPrinter
  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7
      file_name = "#{current_path}/../image/#{counter}.txt"

      begin
        file = File.new(file_name, 'r:UTF-8')
        @status_image << file.read
        file.close
      rescue SystemCallError
        @status_image << "\n[ Изображение не найдено ]\n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls

    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"

    puts "Ошибки: #{game.bad_letters.join(', ')}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts "\nВы проиграли :(\n"
      puts 'Загаданное слово было: ' + game.letters.join('')
      puts
    elsif game.status == 1
      puts "Поздравляем, вы выиграли!\n\n"
    else
      puts 'У вас осталось ошибок: ' + (7 - game.errors).to_s
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ''
    letters.each do |item|
      result += good_letters.include?(item) ? item + ' ' : '__ '
    end
    result
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end

  def cls
    system('clear') || system('cls')
  end
end