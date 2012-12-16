class PagesController < ApplicationController

  def home
    @top_tracks = Track.top.by_rank
    if signed_in?

    end
  end
  
end
