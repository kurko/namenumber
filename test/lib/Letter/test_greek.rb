require "test/unit"
require "namenumber/greek"

class TestGreek < Test::Unit::TestCase
  
  def test_greek_numbers
    assert_equal 1, NameNumber::Greek::number("a")
    assert_equal 2, NameNumber::Greek::number("b")
    assert_equal 3, NameNumber::Greek::number("g")
    assert_equal 4, NameNumber::Greek::number("d")
    assert_equal 5, NameNumber::Greek::number("e")
    assert_equal 6, NameNumber::Greek::number("digamma") # doesn't exist anymore
    assert_equal 7, NameNumber::Greek::number("z")
    assert_equal 8, NameNumber::Greek::number("ee")
    assert_equal 9, NameNumber::Greek::number("th")
#    assert_equal 9, NameNumber::Greek::number("t")
    assert_equal 10, NameNumber::Greek::number("i")
    assert_equal 20, NameNumber::Greek::number("k")
    assert_equal 20, NameNumber::Greek::number("c")
    assert_equal 30, NameNumber::Greek::number("l")
    assert_equal 40, NameNumber::Greek::number("m")
    assert_equal 50, NameNumber::Greek::number("n")
    assert_equal 60, NameNumber::Greek::number("x")
    assert_equal 60, NameNumber::Greek::number("sh") # equivalent to x sound
    assert_equal 70, NameNumber::Greek::number("o")
    assert_equal 80, NameNumber::Greek::number("p")
    assert_equal 90, NameNumber::Greek::number("koppa") # koppa letter doesn't exist anymore
    assert_equal 100, NameNumber::Greek::number("r")
    assert_equal 200, NameNumber::Greek::number("s")
    assert_equal 300, NameNumber::Greek::number("t")
    assert_equal 400, NameNumber::Greek::number("u")
    assert_equal 500, NameNumber::Greek::number("f")
    assert_equal 500, NameNumber::Greek::number("ph")
    assert_equal 600, NameNumber::Greek::number("ch") # greek name is chi
    assert_equal 700, NameNumber::Greek::number("ps")
    assert_equal 800, NameNumber::Greek::number("oo") # long o
    assert_equal 900, NameNumber::Greek::number("sampi") # sampi letter doesn't exist anymore
  end
  
  def test_possible_number
    assert_equal [5, 8],    NameNumber::Greek::possible_number("e")
    assert_equal [70, 800], NameNumber::Greek::possible_number("o")
    assert_equal [800],     NameNumber::Greek::possible_number("oo")
    assert_equal [500],     NameNumber::Greek::possible_number("ph")
  end
  
  def test_by_phoneme
    assert_equal ["oo", "o", "ph", "ee", "e"],  NameNumber::Greek::by_phoneme("ooopheee")
    assert_equal ["e", "o", "ee", "ph", "ph"],  NameNumber::Greek::by_phoneme("eoeephph")
    assert_equal ["n", "e", "r", "oo"],         NameNumber::Greek::by_phoneme("neroo")
  end
  
  def test_names_number
    assert_equal [466, 469, 1196, 1199], NameNumber::Greek::name_number("lateino"), "lateino"
    assert_equal [955, 958], NameNumber::Greek::name_number("neroo"),     "neroo"
    assert_equal [372], NameNumber::Greek::name_number("italika"),   "italika"
    assert_equal [294, 297], NameNumber::Greek::name_number("ekkleesia"), "ekklesia"
    assert_equal [8],   NameNumber::Greek::name_number("hee"),       "hee"
    assert_equal [399], NameNumber::Greek::name_number("latinee"),   "latinee"
    assert_equal [259, 262], NameNumber::Greek::name_number("basileia"),  "basileia"
    assert_equal [615, 618], NameNumber::Greek::name_number("teit"),      "teit"
  end
  
  def test_multiple_possibilities
    assert_equal [5, 8],      NameNumber::Greek::name_number("e"), "e or ee?"
    assert_equal [15, 18],    NameNumber::Greek::name_number("ei"), "ei"
    assert_equal [8],  NameNumber::Greek::name_number("ee")
    assert_equal [75, 78, 805, 808],  NameNumber::Greek::name_number("eo")
    assert_equal [225, 228, 955, 958],  NameNumber::Greek::name_number("nero")
  end
  
end
