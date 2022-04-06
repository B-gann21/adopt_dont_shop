require 'rails_helper'

RSpec.describe 'the shelter show' do
  before :each do
    @shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: @shelter.id)

    visit "/pets/#{@pet.id}"
  end

  it "shows the shelter and all it's attributes" do

    expect(page).to have_content(@pet.name)
    expect(page).to have_content(@pet.age)
    expect(page).to have_content(@pet.adoptable)
    expect(page).to have_content(@pet.breed)
    expect(page).to have_content(@pet.shelter_name)
  end

  it "allows the user to delete a pet" do
    click_on("Delete #{@pet.name}")

    expect(page).to have_current_path('/pets')
    expect(page).to_not have_content(@pet.name)
  end
end
