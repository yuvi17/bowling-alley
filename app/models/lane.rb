# frozen_string_literal: true

# Lane of an alley
class Lane < ApplicationRecord
  belongs_to :alley
  has_many :games

  enum status: {
    free: 1,
    busy: 2
  }

  def self.free_lane
    Lane.where(status: :free).pluck(:id).sample
  end
end
