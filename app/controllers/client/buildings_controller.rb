class Client::BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def new
  end

  def create
    @building = Building.create(
                     name: params[:name],
                     address: params[:address],
                     height: params[:height],
                     construction_date: params[:construction_date],
                     architect: params[:architect]
                    )
    redirect_to "/client/buildings/#{@building.id}"
  end

  def show
    @building = Building.find(params[:id])  
  end

  def edit
    @building = Building.find(params[:id])  
  end

  def update
    @building = Building.find(params[:id])
    @building.update(
                     name: params[:name],
                     address: params[:address],
                     height: params[:height],
                     construction_date: params[:construction_date],
                     architect: params[:architect]
                     )

    redirect_to "/client/buildings/#{@building.id}"
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to "/"
  end
end