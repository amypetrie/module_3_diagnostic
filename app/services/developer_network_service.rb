require 'json'
class DeveloperNetworkService

  def initialize(filter)
    @zip = filter[:zip]
  end

  def stations
    response = conn.get
    JSON.parse(response.body, symbolize_name: true)
  end

  # def get_json(url)
  #   response = conn.get(url)
  #   JSON.parse(response.body, symbolize_name: true)[:fuel_stations]
  # end

  def conn
    Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |faraday|
      faraday.headers['api_key'] = ENV["DEVELOPER_NETWORK_API_KEY"]
      faraday.headers['radius'] = 6.0
      faraday.headers['fuel_type'] = "ELEC, LPG"
      faraday.headers['location'] = 80203
      faraday.adapter  Faraday.default_adapter
    end
  end

end
