class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :images
      t.integer :cid
      t.string :collection_type
      t.decimal :price
      t.string :type
      t.string :link
      t.integer :duration
      t.string :sample
      t.integer :tid
      t.integer :aid
      t.integer :gid
      t.integer :rank
      t.text :rank_history
      
      t.timestamps
    end
  end
end
