class AddUserOnTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :posted_by, :integer
  end
end
