require 'rails_helper'

describe "As a user" do
  it "I can see a list of students" do
    visit "/"
    select "Slytherin", from: :house
    click_on "Get Students"

    expect(current_path).to be("/search?house=slytherin")
    expect(page).to have_content("22 Students")
    expect(page).to have_css(".student", count: 22)
    expect(page).to have_css(".student_name", count: 22)
    expect(page).to have_css(".student_id", count: 22)
  end
end

#
# You are the new web developer for Hogwarts. The IT staff has provided an API where you can get a listing of students.
#
# `http://hogwarts-it.herokuapp.com`
#
# You are to create an app and complete this following user story:
#
# ```
# As a user
# When I visit "/"
# And I select "Slytherin" from the dropdown
# And I click on "Get Students"
# Then my path should be "/search" with "house=slytherin" in the parameters
# And I should see a message "22 Students"
# And I should see a list of the 22 members of Slytherin
# And I should see a name and id for each student.
# ```
