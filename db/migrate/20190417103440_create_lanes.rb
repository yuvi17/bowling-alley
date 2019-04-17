class CreateLanes < ActiveRecord::Migration[5.2]
  def change
    create_table :lanes do |t|
      t.integer :status
      t.integer :number
      t.references :alley, foreign_key: true

      t.timestamps
    end
  end
end
