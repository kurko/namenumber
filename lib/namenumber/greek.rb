require File.expand_path("../../namenumber.rb", __FILE__)

module NameNumber
  
  class Greek

    @LETTER_NUMBER = {
      :a => 1,
      :b => 2,
      :g => 3,
      :d => 4,
      :e => 5,
      :digamma => 6, # digamma, doesn't exist anymore
      :z => 7,
      :ee => 8,
      :th => 9,
      :i => 10,
      :k => 20,
      :c => 20,
      :l => 30,
      :m => 40,
      :n => 50,
      :x => 60,
      :sh => 60,
      :o => 70,
      :p => 80,
      :koppa => 90, # koppa, doesn't exist anymore
      :r => 100,
      :s => 200,
      :t => 300,
      :u => 400,
      :f => 500,
      :ph => 500,
      :ch => 600,
      :ps => 700,
      :oo => 800,
      :sampi => 900 # koppa, doesn't exist anymore
    }
  
    class << self
      attr_accessor :LETTER_NUMBER
    end
  
    def self.number letter
      return @LETTER_NUMBER[letter.to_sym] if @LETTER_NUMBER.has_key? letter.to_sym
      0
    end
    
    def self.possible_number letter
      result = []
      result << self.number(letter)
      result << self.number(letter+letter) if self.number(letter+letter) != 0
      result
    end
    
    def self.by_phoneme string
      string_array = string.split //
      result = []
      string_array.each_with_index { |v,i|
        possible_phoneme = v + string_array[i+1].to_s

        if @LETTER_NUMBER.has_key? possible_phoneme.to_sym
          string_array.delete_at(i+1)
          result << possible_phoneme
        else
          result << v
        end
      }
      result
    end
    
    def self.name_number word = ""
      return false if word.empty?
      sum = [0]
      self.by_phoneme(word).each{ |l|
        number = self.possible_number(l)
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
#          puts " >>>>>>>>>> "
#          puts "++ " + sum.inspect + " ++"
#          puts ">> " + buffer.inspect + " <<"
          sum_temp = sum.collect { |s| s }

          sum_temp.each_with_index { |v, i|
            sum[i] = false
            buffer.each { |b|
#              puts "== b:" + b.to_s + " _ v:" + v.to_s
              sum << v + b
            }
          }
          sum.delete_if { |s| s == false }
#          puts "++ " + sum.inspect + " ++"
        end
      }
      sum.sort!
    end

  end
  
end