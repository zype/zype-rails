class PlaylistsController < ApplicationController

  def show
    @playlist = @zype.playlists.find(params[:id])

    @count = 10
    @page = params[:page].present? ? params[:page] : 1
    @videos = @playlist.videos(page: @page, per_page: @count)
  end

end
