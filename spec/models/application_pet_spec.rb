require 'rails_helper'

RSpec.describe ApplicationPet do
  describe 'relationships' do
    it { should belong_to(:pet) }
    it { should belong_to(:application) }
  end

  describe 'class methods' do
    before :each do
      @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
      @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

      @pet1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
      @pet2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
      @pet3 = @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)

      @application_1 = Application.create(name: 'Billy Jonson', street_address: '123 Main Lane', city: 'Denver', state: 'New Jersey', zip_code: '12121')
      @application_2 = Application.create(name: 'Billy Jonson', street_address: '123 Main Lane', city: 'Denver', state: 'New Jersey', zip_code: '12121')

      @app_pet_1 = ApplicationPet.create(application_id: @application_1.id, pet_id: @pet1.id)
      @app_pet_2 = ApplicationPet.create(application_id: @application_2.id, pet_id: @pet2.id)
    end

    it '#find_instance(app_id, pet_id) should find a specific ApplicationPet' do
      expect(ApplicationPet.find_instance(@application_1.id, @pet1.id)).to eq(@app_pet_1)
      expect(ApplicationPet.find_instance(@application_2.id, @pet2.id)).to eq(@app_pet_2)
    end
  end
end
