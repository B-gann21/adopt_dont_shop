class AddApprovalStatusToApplicationPets < ActiveRecord::Migration[5.2]
  def change
    add_column :application_pets, :approval_status, :string
  end
end
