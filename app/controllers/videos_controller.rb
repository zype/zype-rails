class VideosController < ApplicationController
  def index
    @count = 500
    @page = params[:page].present? ? params[:page] : 1

    @videos = @zype.videos.all(q: params[:q], page: @page, sort: 'title', per_page: @count)
  end

  def show
    @video = @zype.videos.find(params[:id])
  end

  private
  def setup_presenters
    @video_presenter = VideoPresenter.new
    super
  end
end
