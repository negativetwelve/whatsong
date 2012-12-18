class AddArtistNameToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :artist_name, :string
  end
end
