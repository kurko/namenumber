# encoding: UTF-8

require "test/unit"
require "namenumber/greek"

class TestGreek < Test::Unit::TestCase
  
  def setup
    @greek = NameNumber::Greek.new
  end
  
  def test_greek_numbers
    assert_equal 1, @greek.number("a")
    assert_equal 2, @greek.number("b")
    assert_equal 3, @greek.number("g")
    assert_equal 4, @greek.number("d")
    assert_equal 5, @greek.number("e")
    assert_equal 6, @greek.number("digamma") # doesn't exist anymore
    assert_equal 7, @greek.number("z")
    assert_equal 8, @greek.number("ee")
    assert_equal 9, @greek.number("th")
#    assert_equal 9, @greek.number("t")
    assert_equal 10, @greek.number("i")
    assert_equal 20, @greek.number("k")
    assert_equal 20, @greek.number("c")
    assert_equal 30, @greek.number("l")
    assert_equal 40, @greek.number("m")
    assert_equal 50, @greek.number("n")
    assert_equal 60, @greek.number("x")
    assert_equal 60, @greek.number("sh") # equivalent to x sound
    assert_equal 70, @greek.number("o")
    assert_equal 80, @greek.number("p")
    assert_equal 90, @greek.number("koppa") # koppa letter doesn't exist anymore
    assert_equal 100, @greek.number("r")
    assert_equal 200, @greek.number("s")
    assert_equal 300, @greek.number("t")
    assert_equal 400, @greek.number("u")
    assert_equal 500, @greek.number("f")
    assert_equal 500, @greek.number("ph")
    assert_equal 600, @greek.number("ch") # greek name is chi
    assert_equal 700, @greek.number("ps")
    assert_equal 800, @greek.number("oo") # long o
    assert_equal 900, @greek.number("sampi") # sampi letter doesn't exist anymore
  end
  
  def test_possible_number
    assert_equal [5, 8],    @greek.possible_number("e")
    assert_equal [70, 800], @greek.possible_number("o")
    assert_equal [800],     @greek.possible_number("oo")
    assert_equal [500],     @greek.possible_number("ph")
  end
  
  def test_by_phoneme
    assert_equal ["oo", "o", "ph", "ee", "e"],  @greek.by_phoneme("ooopheee")
    assert_equal ["e", "o", "ee", "ph", "ph"],  @greek.by_phoneme("eoeephph")
    assert_equal ["n", "e", "r", "oo"],         @greek.by_phoneme("neroo")
  end
  
  def test_names_number
    assert_equal [466, 469, 1196, 1199], @greek.name_number("lateino"), "lateino"
    assert_equal [955, 958],    @greek.name_number("neroo"),      "neroo"
    assert_equal [372],         @greek.name_number("italika"),    "italika"
    assert_equal [294, 297],    @greek.name_number("ekkleesia"),  "ekklesia"
    assert_equal [8],           @greek.name_number("hee"),        "hee"
    assert_equal [5,8],         @greek.name_number("he"),         "he"
    assert_equal [399],         @greek.name_number("latinee"),    "latinee"
    assert_equal [259, 262],    @greek.name_number("basileia"),   "basileia"
    assert_equal [615, 618],    @greek.name_number("teit"),       "teit"
    assert_equal [888, 1618],   @greek.name_number("ieesous"),    "ieesous"
  end
  
  def test_multiple_possibilities
    assert_equal [5, 8],                @greek.name_number("e"), "e or ee?"
    assert_equal [15, 18],              @greek.name_number("ei"), "ei"
    assert_equal [8],                   @greek.name_number("ee")
    assert_equal [75, 78, 805, 808],    @greek.name_number("eo")
    assert_equal [225, 228, 955, 958],  @greek.name_number("nero")
  end
  
end
