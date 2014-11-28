class MainController < ApplicationController
  def index
    @playlists = @zype.playlists(sort: 'priority', order: 'asc', per_page: 10)
  end

  private
  def setup_presenters
    @main = MainPresenter.new
    super
  end
end
