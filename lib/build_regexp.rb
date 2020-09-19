class BuildRegexp

  CONSONANTS = %w[ нл кг бхц тз чр п шжщ см вф д ]
  WOVELS = "[^#{CONSONANTS.join}]".freeze


  def call(number_string)
    string = number_string.chars.map do |digit|
      "[#{CONSONANTS[digit.to_i]}]#{WOVELS}*"
    end.join

    Regexp.new("^#{WOVELS}*#{string}$")
  end
end


