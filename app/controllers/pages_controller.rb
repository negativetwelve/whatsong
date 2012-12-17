class PagesController < ApplicationController

  def home
    @top_tracks = Track.top.by_rank
    @track = Track.find_by_tid(params[:tid])
    if signed_in?

    end
  end
  
end
