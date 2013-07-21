class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  #methods
    #checking if t`he input is correct 
end
