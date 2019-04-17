class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :name
      t.references :game, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
