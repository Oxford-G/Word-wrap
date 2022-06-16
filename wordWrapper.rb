class Wrapper
  def self.wrap(array, column)
    return "Expected String but got #{array.class}" if array.class != String
    return "Expected Integer but got #{column.class}" if column.class != Integer
    return 'Provide a column atleast greater than 0' if column < 1

    return '' if array == ''
    return ' ' if array == ' '

    returned_words = ""

    word_array = array.split(/\s|-/)

    line = word_array.shift

    word_array.each do |word|

      if (line + " " + word).length <= column

        line << " " + word

      elsif word.length > column
        returned_words << line + "\n" unless line.empty?
        line = ""
        word.each_char do |c|
          line << c
          if line.length == column
            returned_words << line + "\n"
            line = ""
          end
        end
      else
        returned_words << line + "\n"
        line = word
      end
    end
    returned_words << line
  end
end
