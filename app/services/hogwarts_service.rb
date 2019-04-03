class HogwartsService

  def fetch_students(house)
    url = "api/v1/house/#{house.downcase}?"
    get_json(url)
  end

  def get_json(url)
    response =
    JSON.parse(conn.get(url))
  end

  def conn
    Faraday.new(url: "http://hogwarts-it.herokuapp.com/") do |faraday|
      faraday.parameters["api_key"] = "3fhZMZNXVndxk51mILsdVnGN6tF8KBI6"
    end
  end

end
