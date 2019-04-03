class HogwartsService

  def student_data(house)
    json("/api/v1/house/#{house.downcase}?")
  end

  def json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => "http://hogwarts-it.herokuapp.com") do |faraday|
      faraday.params['api_key'] = '3fhZMZNXVndxk51mILsdVnGN6tF8KBI6'
      faraday.adapter Faraday.default_adapter
    end
  end

end
