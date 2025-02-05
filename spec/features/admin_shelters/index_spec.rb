require 'rails_helper'

RSpec.describe 'the admin shelters index' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
    @pet1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet3 = @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @application1 = @pet1.applications.create!(name: "Billy Swanson", street_address: "123 Main Lane", city: "Dallas", state: "New Hampshire", zip_code: "12121")
  end

  it 'shows the admin/index in reverse alphabetical order' do
    visit "/admin/shelters"

    expect(@shelter_2.name).to appear_before(@shelter_3.name)
    expect(@shelter_3.name).to appear_before(@shelter_1.name)
    expect(@shelter_1.name).to_not appear_before(@shelter_3.name)
    expect(@shelter_1.name).to_not appear_before(@shelter_2.name)
  end

  it 'shows the shelters with pending applications' do

    visit "/applications/#{@application1.id}"

    fill_in :search, with: "Mr. Pirate"

    click_button "Search"

    click_button "Adopt this Pet"

    fill_in :description, with: "I work from home."

    click_button "Submit Application"

    visit '/admin/shelters'

    within '#shelters-with-pending-apps' do
      expect(page).to have_content("Aurora shelter")
    end
  end
end
