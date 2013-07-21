class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  scope :right, -> { where(completed: true) }
  scope :wrong, -> { where(completed: false) }

  def answer(guess)
    if guess.downcase == self.card.back.downcase 
      self.completed = true
    else
      self.completed = false
    end      
    self.save  
  end
end
