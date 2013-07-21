Deck.create(name: "English Vocabulary")
Deck.create(name: "Art Vocabulary")
 
  def load_cards
    CSV.foreach('vocabulary.csv', :headers => true, :header_converters => :symbol, :converters => :all ) do |row|
       Card.create(front: row[0], back: row[1], deck_id: 1)
    end
  end 

  def load_cards_2
    CSV.foreach('art.csv', :headers => true, :header_converters => :symbol, :converters => :all  ) do |row|
       Card.create(front: row[0], back: row[1], deck_id: 2)
    end
  end 

load_cards
load_cards_2

# Deck.create(name: "Good stuff")
# Deck.create(name: "Bad Stuff")

# Card.create(:front => "kittens", :back => "pet em", :deck_id => 1)
# Card.create(:front => "penguins", :back => "KILL THEM", :deck_id => 1)
# Card.create(:front => "baby harp seals", :back => "yummy", :deck_id => 1)

# Card.create(:front => "berries", :back => "scratch em", :deck_id => 2)
# Card.create(:front => "twig", :back => "rubsies", :deck_id => 2)
# Card.create(:front => "bum bum", :back => "stay away", :deck_id => 2)

# User.create(name: "Jonathan")
