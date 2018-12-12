class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    stations_search_results.map do |station|
      Station.new(station[])
    end
  end

  def stations_search_results
    @stations ||= DeveloperNetworkService.new({zip: @zip})
  end

end
