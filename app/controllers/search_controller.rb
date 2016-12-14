class SearchController < ApplicationController
  def index
    if params[:q]
      zipcode = params[:q]
      url  =  "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC&location=#{zipcode}&limit=10"
      uri = URI(url)
      electric_response = Net::HTTP.get(uri)

      url  =  "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG&location=#{zipcode}&limit=10"
      uri = URI(url)
      propane_response = Net::HTTP.get(uri)


      @electric_stations = FuelingStation.parse_and_create(electric_response)
      @gas_stations =  FuelingStation.parse_and_create(propane_response)
    end
  end
end
#
