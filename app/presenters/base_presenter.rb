class BasePresenter
  def initialize
    @zype = Zype::Client.new
  end

  def filter_by_category(inputs,key,value)
    inputs.select{|v| category_value(v,key).include?(value) }
  end

  def category_value(input,title)
    if input.categories && category = input.categories.detect{|c| c.title == title}
      category.value
    end
  end

  def playlists(categories={})
    @zype.playlists.all('category' => categories)
  end

end
