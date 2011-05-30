# encoding: UTF-8

module NameNumber
  
  class Language
    
    def number letter
      return @letter_number[letter.to_sym] if @letter_number.has_key? letter.to_sym
      0
    end
    
    def possible_number letter
      result = []
      result << number(letter)
      result << number(letter+letter) if number(letter+letter) != 0
      result
    end
    
    def by_phoneme string
      string_array = string.split //
      result = []
      string_array.each_with_index { |v,i|
        possible_phoneme = v + string_array[i+1].to_s

        if @letter_number.has_key? possible_phoneme.to_sym
          string_array.delete_at(i+1)
          result << possible_phoneme
        else
          result << v
        end
      }
      result
    end
    
    def name_number word = ""
      return false if word.empty?
      sum = [0]
      by_phoneme(word).each{ |l|
        number = possible_number(l)
        buffer = []
        if number.count == 1
          sum.collect! { |s|
            s += number.first
          }
        else
          number.each { |n|
            buffer << n
          }
        end

        unless buffer.empty?
          sum_temp = sum.collect { |s| s }

          sum_temp.each_with_index { |v, i|
            sum[i] = false
            buffer.each { |b|
              sum << v + b
            }
          }
          sum.delete_if { |s| s == false }
        end
      }
      sum.sort!
    end
    
  end
  
end