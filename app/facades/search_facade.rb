class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations ||= DeveloperNetworkService.new({zip: @zip})
  end

end
