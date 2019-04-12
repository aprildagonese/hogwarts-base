class HogwartsService

  def initialize(house)
    @_house = house
  end

  def student_data
    json("/api/v1/house/#{house_id}?")
  end

  def json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => "https://hogwarts-as-a-service.herokuapp.com") do |faraday|
      faraday.headers['x-api_key'] = 'lumos'
      faraday.adapter Faraday.default_adapter
    end
  end

  private
  attr_reader :_house

  def house_id
    house_ids[house]
  end

  def house_ids
    {
      gryffindor: 1,
      ravenclaw: 2,
      hufflepuff: 3,
      slytherin: 4
     }
  end

  def house
    _house .downcase.to_sym
  end

end
