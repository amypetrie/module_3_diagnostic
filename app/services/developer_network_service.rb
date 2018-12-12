class DeveloperNetworkService

  def initialize(filter)
    @zip = filter[:zip]
  end

  def stations
    get_json()
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_name: true)
  end

  def conn
    Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |faraday|
      faraday.headers['api_key'] = ENV["DEVELOPER_NETWORK_API_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

end
