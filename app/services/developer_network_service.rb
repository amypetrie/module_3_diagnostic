require 'json'
class DeveloperNetworkService

  def initialize(filter)
    @zip = filter[:zip]
  end

  def stations
    response = conn.get("?location=#{@zip}")
    JSON.parse(response.body, symbolize_name: true)["fuel_stations"]
  end

  def conn
    Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |faraday|
      faraday.params['api_key'] = ENV["DEVELOPER_NETWORK_API_KEY"]
      faraday.params['radius'] = 6.0
      faraday.params['fuel_type'] = "ELEC, LPG"
      faraday.adapter  Faraday.default_adapter
    end
  end

end
