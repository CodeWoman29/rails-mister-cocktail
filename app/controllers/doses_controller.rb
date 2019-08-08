class DosesController < ApplicationController
  before_action :set_doses,

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_doses_path(cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = dose.find(params[:id])
    @dose.destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def ingredients_params
    params.require(:dose).permit(:name)
  end
end
