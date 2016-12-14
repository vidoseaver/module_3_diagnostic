require 'rails_helper'

RSpec.feature "user enters a zipcode and clicks search" do
  context "they are directed to a page that where the url is /search" do
    it "shows the ten closests stations within 6 miles" do

      visit root_path

      zipcode = "80203"

      fill_in "q", :with => zipcode
      click_button "Locate"

      expect(current_path).to have_content("/search/#{zipcode}")
    end
  end
end
