class IngredientsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(plant_params)
    @ingredient.cocktail = @cocktail

    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to cocktail_path(@ingredient.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def ingredients_params
    params.require(:ingredient).permit(
      :name,
    )
  end
end
