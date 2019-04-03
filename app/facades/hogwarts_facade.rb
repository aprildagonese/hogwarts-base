class HogwartsFacade

  def students(house)
    service.fetch_students(house)
  end

  def service
    HogwartsService.new
  end

end
