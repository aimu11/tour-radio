class AddTrackToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :track, :string
  end
end
