require 'countries'

module ToursHelper
  def get_activity_string(activity_ids)
    activity_ids.
      map { |el| @tours[1][el['id'].to_sym] }.
      join(', ')
  end

  def country_flag(code)
    ISO3166::Country.new(code).emoji_flag
  end
end
