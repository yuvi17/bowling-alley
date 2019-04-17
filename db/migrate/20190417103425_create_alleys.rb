class CreateAlleys < ActiveRecord::Migration[5.2]
  def change
    create_table :alleys do |t|
      t.string :name

      t.timestamps
    end
  end
end
