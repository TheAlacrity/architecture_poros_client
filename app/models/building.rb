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

  def self.create(input_options) # create action
    response = HTTP.post("http://localhost:3000/api/buildings", 
                         form: input_options
                         )
    Building.new(response.parse)
  end

  def update(input_options) # edit
    response = HTTP.patch(
                          "http://localhost:3000/api/buildings/#{id}", 
                          form: input_options
                          )

    @id = response.parse["id"]
  end

  def destroy # destroy
    response = HTTP.delete("http://localhost:3000/api/buildings/#{self.id}")
  end
end