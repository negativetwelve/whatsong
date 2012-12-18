class Track < ActiveRecord::Base
  attr_accessible :name, :images, :cid, :collection_type, :price, :type, :link, :duration, :sample, :tid, :aid, :gid, :rank, :rank_history, :artist_name
  
  serialize :images, Array
  serialize :rank_history, Hash
  
  scope :top, where("rank IS NOT NULL")
  scope :by_rank, order(:rank)
  scope :no_youtube, where("youtube_id IS NULL")
end
