# class documentation
class WordReader
  def read_from_file(full_path)
    begin
      file = File.new(full_path, 'r:UTF-8')
    rescue SystemCallError
      abort "Список слов-загадок для игры по адресу '#{full_path}' не найден!"
    end
    lines = file.readlines
    file.close
    lines.sample.chomp
  end
end