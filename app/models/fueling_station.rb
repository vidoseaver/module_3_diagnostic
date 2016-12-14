class FuelingStation
  attr_reader :id, :name, :address,:fuel_types, :distance, :access_times
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:ev_network]
    @address = "#{attributes[:street_address]} #{attributes[:zipcode]}"
    @fuel_types = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end

  def self.parse_and_create(raw_json)
    parsed_response = JSON.parse(raw_json, symbolize_names:true)
    fuel_stations = parsed_response[:fuel_stations]
    fuel_stations.map do |station|
      FuelingStation.new(station)
    end
  end
end
