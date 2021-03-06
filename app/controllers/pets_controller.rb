class PetsController < ApplicationController
  def index
    @pets = Pet.all.sort_by_status

  end
  
  def show
    @pet = Pet.find(params[:id])
  end

  def new
    
  end

  def edit
    @pet = Pet.find(params[:id])
    # @shelter = Shelter.find(params[:id])
  end
  
  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{params[:id]}"
  end
  
  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets/"
  end
  
  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :status)
  end
end