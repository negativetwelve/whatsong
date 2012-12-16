class Track < ActiveRecord::Base
  attr_accessible :name, :images, :cid, :collection_type, :price, :type, :link, :duration, :sample, :tid, :aid, :gid, :rank, :rank_history
  
  serialize :images, Array
  serialize :rank_history, Hash
  
  scope :top, where("rank IS NOT NULL")
  scope :by_rank, order(:rank)
end
