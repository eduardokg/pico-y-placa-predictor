require 'rails_helper' 
 
RSpec.describe "Predictors", type: :request do
  describe "GET /predictors" do
    it "checks if license plate entered have traffic restriction on Wednesday 16:40" do
      visit root_path
      fill_in "license_plates", :with => "PAA9195"
      fill_in "date", :with => "04/26/2017"
      select "16", :from => "time__4i"
      select "40", :from => "time__5i"
      click_button "Check"
      page.should have_content("You are restricted to drive this vehicle")
    end

    it "license plate empty field" do
      visit root_path
      fill_in "date", :with => "04/26/2017"
      select "16", :from => "time__4i"
      select "40", :from => "time__5i"
      click_button "Check"
      # page.should have_content("Please fill out this field")
    end
  end
end
