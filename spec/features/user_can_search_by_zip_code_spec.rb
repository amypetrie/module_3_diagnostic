require 'rails_helper'

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
  it 'sees 10 closest stations' do

    visit "/"
    page.fill_in "q", with: 80203
    click_on "Locate"

    expect(page).to have_content
  end
end
