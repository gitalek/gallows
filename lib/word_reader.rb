# class documentation
class WordReader
  def read_from_file(path_to_file)
    begin
      file = File.new(path_to_file, 'r:UTF-8')
    rescue SystemCallError
      abort "Список слов-загадок для игры по адресу '#{path_to_file}' не найден!"
    end
    lines = file.readlines
    file.close
    lines.sample.chomp
  end
end