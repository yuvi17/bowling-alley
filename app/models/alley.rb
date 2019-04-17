# frozen_string_literal: true

# Our bowling alley
class Alley < ApplicationRecord
  has_many :lanes
end
