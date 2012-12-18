class AddYoutubeToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :youtube_id, :string
  end
end
