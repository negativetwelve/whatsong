require 'open-uri'

task add_youtube_to_tracks: :environment do
  Track.all.each do |track|
    youtube_id = find_youtube_version(track.name + " " + track.artist_name)
    track.youtube_id = youtube_id
    track.save
    puts youtube_id
  end
end

def find_youtube_version(song_title)
  url_song_title = song_title.split(/[\s,]/).select{|_w| _w =~ /^\w+$/}.join("+")
  url = "https://gdata.youtube.com/feeds/api/videos?q=#{url_song_title}&max-results=3&category=Music&format=5&alt=json"
  link = JSON.parse(RestClient.get(url))["feed"]["entry"][0]["id"]["$t"][-11..-1]
end

