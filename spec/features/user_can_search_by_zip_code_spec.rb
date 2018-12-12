require 'rails_helper'

describe "As a user" do
  it 'can visit dashboard and submit zip code' do
    visit "/"

    page.fill_in "q", with: 80203
    click_on "Locate"
    expect(page).to eq "/search"
  end
#   As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
end
