# encoding: UTF-8
require File.expand_path("../../namenumber.rb", __FILE__)

module NameNumber
  
  class Greek < NameNumber::Language

    attr_accessor :letter_number
  
    def initialize
      
      @letter_number = {
        :φ => 5000,
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
    end
  
  end
  
end