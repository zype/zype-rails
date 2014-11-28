module ApplicationHelper
  def time_to_midnight
    1.day.from_now.midnight.to_i - Time.now.to_i
  end

  def friendly_title(title)
    title.parameterize
  end

  def video_overlay(video)
    if video.thumbnails.blank?
      "white"
    elsif thumbnail = video_thumbnail_url(video, {width:426})
      "url('#{thumbnail}')"
    elsif thumbnail = video_thumbnail_url(video, {width:480})
      "url('#{thumbnail}')"
    end
  end

  def video_thumbnail_url(video, params={}, options={})
    return unless video.thumbnails

    image = if params[:width]
      video.thumbnails.detect{|t| t.width == params[:width]}
    elsif params[:height]
      video.thumbnails.detect{|t| t.height == params[:height]}
    else
      raise ArgumentError, "Height or width is required to detect thumbnail URL"
    end

    if image
      return image.url
    else
      return nil
    end
  end

  def video_image(video, title, options={})
    return nil if video.images.blank?

    if image = video.images.detect{|i| i.title == title}
      image_tag image.url, options
    end
  end
end
