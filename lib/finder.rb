require_relative 'build_regexp'

class Finder
  def call(number)
    res = nil
    reg = BuildRegexp.new.call(number.to_s)
    File.open('lib/singular_and_plural.txt', 'r') do |file|
      res = file.find_all do |line|
        line.chomp =~ reg
      end
    end
    res.map(&:chomp)
  end
end