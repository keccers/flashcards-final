class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses
  #take in a deck name
    # load up the cards based on the deck name
  #iterate thru the cards
    #checks if there are cards left
    #takes a card out after correct
end
