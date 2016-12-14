class  FuelStationService
  def self.find_electric_stations_within_6(zipcode)
    url  =  "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC&location=#{zipcode}&limit=10"
    uri = URI(url)
    electric_response = Net::HTTP.get(uri)
    FuelStation.parse_and_create(electric_response)
  end
  def self.find_propane_stations_within_6(zipcode)
    url  =  "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG&location=#{zipcode}&limit=10"
    uri = URI(url)
    electric_response = Net::HTTP.get(uri)
    FuelStation.parse_and_create(electric_response)
  end
end
