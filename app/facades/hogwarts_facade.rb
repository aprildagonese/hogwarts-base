class HogwartsFacade

  def initialize(house)
    @house = house
  end

  def student_count
    students.count
  end

  def students
    @students = []
    student_results.each do |student|
      wizard = Student.new(student)
      @students << wizard
    end
    @students
  end

  def student_results
    service.student_data(@house)[:data][0][:attributes][:students]
  end

  def service
    HogwartsService.new
  end

end
