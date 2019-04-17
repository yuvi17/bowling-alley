# frozen_string_literal: true

# player model
class Player < ApplicationRecord
  belongs_to :game

  has_many :rounds

  attr_reader :score

  def init_game
    rounds.create(game: game)
    rounds.last.update!(status: :active, round_number: 1)
    rounds.last.save!
  end

  def play(current_score)
    round = rounds.last
    return false if round.completed?

    round.play_round(current_score)

    if round.completed?
      Round.create(
        player_id: id,
        status: :active, 
        game: game, 
        round_number: round.round_number + 1
      )
    end

    score_by_rounds
  end

  def update_score
    self.score += rounds.last.score
    save!
  end

  def score_by_rounds
    rounds.pluck(:id, :score)
  end
end
