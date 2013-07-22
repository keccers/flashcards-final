class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  scope :last_five, -> { order("id desc").limit(5) }

end
