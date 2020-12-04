class ScrambledDiary

  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def scramble(method)
    @contents = method.scramble(@contents)
  end

  def unscramble(method)
    @contents = method.unscramble(@contents)
  end

end

class Reverse

  def scramble(contents)
    contents.reverse
  end

  def unscramble(contents)
    contents.reverse
  end

end

class Advancing 

  def initialize(steps)
    @steps = steps
  end

  def scramble(contents)
    plain_chars = contents.chars
    scrambled_chars = plain_chars.map do |char|
      (char.ord + @steps).chr
    end
    scrambled_chars.join
  end

  def unscramble(contents)
    scrambled_chars = contents.chars
    plain_chars = scrambled_chars.map do |char|
      (char.ord - @steps).chr
    end
    plain_chars.join
  end

end
