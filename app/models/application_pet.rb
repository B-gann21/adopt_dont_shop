class ApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.find_instance(desired_app_id, desired_pet_id)
    where("application_id = #{desired_app_id} AND pet_id = #{desired_pet_id}")[0]
  end
end
