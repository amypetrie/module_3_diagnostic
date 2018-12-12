
require "rails_helper"

describe DeveloperNetworkService do
  describe "stations" do
    it "finds all stations within 6 miles" do
      VCR.use_cassette("stations") do
        service = DeveloperNetworkService.new({zip: 80203})
        stations = service.stations

        expect(stations.count).to eq 20
        expect(stations.first["station_name"]).to eq "UDR"
      end
    end
  end

end
