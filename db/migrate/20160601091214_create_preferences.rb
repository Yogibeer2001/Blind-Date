class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
            t.integer :min_age
            t.integer :max_age
            t.string :gender
            t.string :location
            t.references :user
      t.timestamps null: false
    end
  end
end
