class SearchController < ApplicationController
  def index
    if params[:q]
      zipcode = params[:q]
      @electric_stations = FuelStationService.find_electric_stations_within_6(zipcode)
      @gas_stations =  FuelStationService.find_propane_stations_within_6(zipcode)
    end
  end
end
#
