class ApplicationPetsController < ApplicationController
  def create
    ApplicationPet.create(application_id:params[:id],   pet_id:params[:pet_id])
    redirect_to "/applications/#{params[:id]}?submit=true"
  end

  def update
    application = Application.find(params[:id])
    application_pet = ApplicationPet.find_instance(params[:id], params[:pet_id])
    if params[:status] == 'approved'
      application_pet.update(approval_status: 'approved')
    elsif params[:status] == 'rejected'
      application_pet.update(approval_status: 'rejected')
    end
    redirect_to "/admin/applications/#{application.id}"
  end
end
