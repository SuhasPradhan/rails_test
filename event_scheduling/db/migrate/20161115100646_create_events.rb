class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :venue
      t.string :date
      t.string :time
      t.string :description
      t.string :status
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
