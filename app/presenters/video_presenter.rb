class VideoPresenter < BasePresenter
  def initialize
    @series = {}
    @series_videos = {}
    @related_videos = {}
    super
  end

  def filter_by_zobject_type(video, zobject_title)
    if zobjects = video.video_zobjects
      zobjects.map{|zobject| zobject if zobject.zobject_type_title == zobject_title}.uniq.compact
    end
  end

  def series(video)
    @series[video._id] ||= @zype.zobjects.all('series', video_id: video._id).first
  end

  def series_videos(series)
    @series_videos[series._id] ||= @zype.videos.all(zobject_id: series._id)
  end

  def series_videos_by_category(series,key,value)
    filter_by_category(series_videos(series),key, value)
  end

  def related_videos(video)
    category = {}
    if video.categories && genre = video.categories.detect { |x| x.title == 'genre' }
      category[:genre] = genre.value
    end

    all_related_videos = @zype.videos.all(category: category, per_page: 25, 'id!' => [video._id])
    @related_videos[video._id] ||= all_related_videos
  end

  def related_media(video)
    @related_media[video._id] ||= @zype.zobjects.all('media', video_id: video._id)
  end

  def videos(params)
    @zype.videos.all(params)
  end
end
