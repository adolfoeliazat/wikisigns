class Game < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :word

  # Check if word exist before creating.
  before_create :check_word
  # Calculate the score after creating.
  after_create :calculate_score

  # Scope for returning the games of the day.
  scope :today, where("created_at >= ? AND created_at < ?", Time.now.at_beginning_of_day, Time.now.tomorrow.at_beginning_of_day)

  # Calculates the game score.
  def calculate_score
    self.score = 0
    self.score = guessed_letters * rand(500) if won?

    self.save
  end

  def check_word
    search_word = Word.find_by_word(self.input)
    if search_word
      self.word = search_word
      self.won = true
    else
      self.word = Word.create(:word => self.input, :user => self.user)
      self.won = false
    end
  end

  private

  # Returns how much the user guessed without the helped letters.
  def guessed_letters
    helped_letters ? word.word.length - helped_letters : word.word.length
  end
end
