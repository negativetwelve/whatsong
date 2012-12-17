require 'open-uri'

namespace :add do
  task :songs, [:amount, :type] => :environment do |t, args|
    puts "Getting songs..."
    tracks = get_tracks(args[:amount], args[:type])
    puts "Adding songs..."
    tracks.each_with_index do |track, index|
      type = args[:type]
      if type == "top"
        add_track_to_db(track, index+1)
      else
        add_track_to_db(track, nil)
      end
    end
    puts "Done."
  end
end

def get_tracks(amount, type)
  url = "https://itunes.apple.com/us/rss/#{type}songs/limit=#{amount}/explicit=true/json"
  tracks = JSON.parse(RestClient.get(url))["feed"]["entry"]
end

def add_track_to_db(track, rank)
  regex = /[i][d][0-9]*[?]/
  id = track["id"]["attributes"]["im:id"].to_i
  old_track = Track.find_by_tid(id)
  if old_track.nil?
    new_track = Track.create!(name: track["im:name"]["label"], images: track["im:image"].map{|x| x["label"]}, 
                  cid: regex.match(track["im:collection"]["link"]["attributes"]["href"]).to_s[2..-2].to_i,
                  collection_type: track["im:collection"]["im:contentType"]["attributes"]["label"], 
                  price: track["im:price"]["attributes"]["amount"], type: track["im:contentType"]["im:contentType"]["attributes"]["label"],
                  link: track["link"][0]["attributes"]["href"], duration: track["link"][1]["im:duration"]["label"],
                  sample: track["link"][1]["attributes"]["href"], tid: track["id"]["attributes"]["im:id"].to_i, 
                  aid: regex.match(track["im:artist"]["attributes"]["href"]).to_s[2..-2].to_i, gid: track["category"]["attributes"]["im:id"].to_i,
                  rank: rank, rank_history: {Date.today => rank})
    puts "Added #{new_track.name} with rank #{new_track.rank}"
  else
    old_track.rank = rank
    old_track[Date.today] = rank
    old_track.save
    puts "Updated #{old_track.name} with rank #{old_track.rank}"
  end
end