class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :track
      t.references :user
      t.timestamps null: false
    end
  end
end
