# frozen_string_literal: true

# an atomic game play
class Round < ApplicationRecord
  belongs_to :game
  belongs_to :player

  STRIKE_BONUS = 10
  SPARE_BONUS = 5

  enum status: {
    active: 1,
    completed: 2
  }

  attr_accessor :status, :round_number

  def score
    score = first + second + third + bonus
    save!
    score
  end

  def bonus
    if first == 10
      STRIKE_BONUS
    elsif first + second == 10
      SPARE_BONUS
    end
  end

  def play_round(current_score)
    if first.nil?
      self.first = current_score
      status = :completed if first == 10 && round_number != 10
    elsif second.nil?
      self.second = current_score
      status = :completed if (first + second) == 10 && round_number != 10
    elsif game.third_attempt_allowed?
      self.third = current_score
      status = :completed
    end
    save!
    status
  end

  def completed?
    status == :completed
  end
end
