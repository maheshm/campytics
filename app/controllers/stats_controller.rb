class StatsController < ApplicationController
  def index
    @chart = LazyHighCharts::HighChart.new('graph')
  end
end
