class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    stations_search_results.map do |station|
      Station.new(station)
    end
  end

  def service
    @service ||= DeveloperNetworkService.new({zip: @zip})
  end

  def stations_search_results
    @stations ||= service.stations
  end

end
