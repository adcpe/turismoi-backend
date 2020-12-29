class ToursController < ApplicationController
  def index
    @tours = GetData.call
  end
end
