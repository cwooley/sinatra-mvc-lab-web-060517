class PigLatinizer

  def piglatinize(text)
    @words_arr = text.split(" ")

    @words_arr.map do |word|
      self.make_array(word).join
    end.join(" ")
  end

  def to_pig_latin(phrase)
    self.piglatinize(phrase)
  end

  def make_array(word)
    vowel_arr = ["a", "e", "i", "o", "u"]
    index_of_first_vowel = nil
    word.chars.each_with_index do |char, index|
      if vowel_arr.include?(char.downcase)
        index_of_first_vowel = index
        break
      end
    end
    if index_of_first_vowel == 0
      word_arr = [word, "way"]
    else
      leading_consonants = word.slice!(0..index_of_first_vowel - 1)
      word_arr = [word, leading_consonants, "ay"]
    end
    word_arr
  end

end
