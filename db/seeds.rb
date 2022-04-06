ApplicationPet.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

@shelter = Shelter.create!(foster_program: true, name: "GoodPets", city: "Denver", rank: 6000)
@shelter2 = Shelter.create!(foster_program: true, name: "Furry Friends For You", city: "Denver", rank: 17)
@shelter3 = Shelter.create!(foster_program: true, name: "Pet Rescue Denver", city: "Denver", rank: 432)

@pet1 = @shelter.pets.create!(adoptable: true, age: 3, breed: "Shepard", name: "Alfonso")
@pet2 = @shelter.pets.create!(adoptable: true, age: 6, breed: "Daschund", name: "Geoffrey")
@pet3 = @shelter.pets.create!(adoptable: true, age: 7, breed: "Pitbull", name: "Harold")

@pet4 = @shelter2.pets.create!(adoptable: true, age: 8, breed: "Cat", name: "Arnie")
@pet5 = @shelter2.pets.create!(adoptable: true, age: 10, breed: "Bulldog", name: "Bruce")
@pet6 = @shelter2.pets.create!(adoptable: true, age: 5, breed: "Terrier", name: "Terry")

@pet7 = @shelter.pets.create!(adoptable: true, age: 4, breed: "Cat", name: "Fred")
@pet8 = @shelter.pets.create!(adoptable: true, age: 8, breed: "Horse", name: "Gerald")
@pet9 = @shelter.pets.create!(adoptable: true, age: 11, breed: "Labrador", name: "Francine")
