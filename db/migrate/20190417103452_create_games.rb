class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :status
      t.references :lane, foreign_key: true

      t.timestamps
    end
  end
end
