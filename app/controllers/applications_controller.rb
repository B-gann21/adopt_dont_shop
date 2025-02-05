class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:search].present?
      @pets = Pet.search(params[:search])
    end

    if @application.status == nil
      @application.status = "In Progress"
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Input required - fields cannot be blank"
      render :new
    end
  end

  def update
    application = Application.find(params[:id])
    application.update(description: params[:description], status: "Pending")
    redirect_to "/applications/#{application.id}?status=pending"
  end

  private

  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status, :pets)
  end
end
