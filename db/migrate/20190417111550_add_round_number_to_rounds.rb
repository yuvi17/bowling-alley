class AddRoundNumberToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :round_number, :integer
  end
end
