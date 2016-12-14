class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    @electric_stations = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC&zip=#{zipcode}&limit=10")
  end
end
