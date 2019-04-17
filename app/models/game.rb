# frozen_string_literal: true

# A particular instance of a game
class Game < ApplicationRecord
  belongs_to :lane

  has_many :players
  has_many :rounds

  enum status: {
    in_progress: 1,
    finished: 2
  }

  def scoreboard
    players.map { |player| [player.id, player.score] }
  end

  def start
    players.each(&:init_game)
  end

  def finish
    game.status = :finished
  end

  def add_players(name)
    players.create(name: name)
  end

  def third_attempt_allowed?
    round = game.rounds.last
    true if round.score >= 10

    false
  end
end
