class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants, only: [:name, :image, :price]
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, only: [:name, :image, :price]
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  def create
    plant = Plant.create(params.permit(:name, :image, :price))
    render json: plant, only: [:name, :image, :price], status: :created
  end
end
