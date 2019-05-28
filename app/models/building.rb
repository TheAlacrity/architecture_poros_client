class Building
  attr_reader :id, :name, :address, :height, :construction_date, :architect

  def initialize(input_options)
    # add attributes here as instance variables
    @id = input_options["id"]
    @name = input_options["name"]
    @address = input_options["address"]
    @height = input_options["height"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"]

  end
  
  def self.all # index action
    response = HTTP.get("http://localhost:3000/api/buildings")  
    building_array = []

    response.parse.each do |building_hash|
      building_array << Building.new(building_hash)
    end

    building_array
  end

  def self.find(input_id) # show action
    response = HTTP.get("http://localhost:3000/api/buildings/#{input_id}")
    Building.new(response.parse)
  end

  # def # create action
    
  # end

  # def # edit
    
  # end

  # def # update
    
  # end

  # def # destroy
    
  # end
end