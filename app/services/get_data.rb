require 'http'
require 'json'

class GetData < ApplicationService
  def initialize
    @key = ENV['APIKEY']
    @tour_data = []
    @activities = {}

    get_data
  end

  def call
    [@tour_data, @activities]
  end

  private

  def get_data
    response = JSON.parse(
      HTTP.auth(@key).
          get('https://api.turismoi.com/api/tours').
          body
    )

    # get attributes from each tour, push it to @tour_data
    response['data'].each { |el| @tour_data << el }

    # populate @activities as: :id = 'name'
    response['included'].each do |el|
      @activities[el['attributes']['id'].to_sym] = el['attributes']['name']
    end
  end
end
