class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :first
      t.integer :second
      t.integer :third
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
