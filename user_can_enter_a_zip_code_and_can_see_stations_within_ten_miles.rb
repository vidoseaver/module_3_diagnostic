require 'rails_helper'

feature "user enters a zipcode and clicks search" do
  context "they are directed to a page that where the url is /search" do
    it "shows the ten closests stations within 6 miles" do

      visit root
      zipcode = "80203"

      fill_in "q", :with => zipcode
      click_button "locate"

      expect(current_path).to have_content("/search/#{zipcode}")
    end
  end
end
