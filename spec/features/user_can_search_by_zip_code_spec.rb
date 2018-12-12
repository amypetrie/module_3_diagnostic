require 'rails_helper'
require 'webmock/rspec'

describe "As a user" do
  it 'can visit dashboard and search by zip code' do

    visit "/"
    page.fill_in "q", with: 80203
    click_on "Locate"

    expect(current_path).to eq "/search"
  end

  # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
  # And the stations should be limited to Electric and Propane
  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  it 'sees a list of station names' do
    visit "/"
    page.fill_in "q", with: 80203
    click_on "Locate"

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json").
      to_return(body: File.read("./spec/fixtures/stations_results.json"))

    within(".stations") do
      expect(page).to have_content("Station name: UDR")
    end
  end

  it 'sees 10 stations' do
    visit "/"
    page.fill_in "q", with: 80203
    click_on "Locate"

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json").
      to_return(body: File.read("./spec/fixtures/stations_results.json"))

    within(".stations") do
      expect(page).to have_content("Station name", count: 10)
    end
  end
end
