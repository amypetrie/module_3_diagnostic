
require "rails_helper"

describe DeveloperNetworkService do
  describe "stations" do
    it "finds all stations within 6 miles" do
      VCR.use_cassette("stations") do
        service = DeveloperNetworkService.new({zip: 80203})
        stations = service.stations
        binding.pry

        expect(stations.count).to eq 267
      end
    end
  end

end
