class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :zype_cli
  before_filter :setup_presenters

  helper_method :group_by_category
  helper_method :filter_by_category
  helper_method :category_value

  private

  def zype_cli
    @zype ||= Zype::Client.new
  end

  def setup_presenters
    @layout = LayoutPresenter.new
  end

  def group_by_category(inputs,category)
    inputs.group_by{|v| category_value(v,category) }
  end

  def filter_by_category(inputs,category,value)
    inputs.select{|v| category_value(v,category).include?(value) }
  end

  def category_value(input,title)
    if input.categories && category = input.categories.detect{|c| c.title == title}
      category.value
    end
  end
end
