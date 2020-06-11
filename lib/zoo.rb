class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = []
    initial_cages
    @employees = []    
  end

  def initial_cages
    10.times { @cages.push(Cage.new) }

    # 10.times do 
    #   @cages.push(Cage.new)
    # end
  end

  def add_employee(employee)
    @employees.push(employee)
  end

  def open?(date)
    date >= @opening_date && date < @closing_date
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return # stop what you are doing and return something (nil in this case) from the method 
      end
    end
    # if we iterated over all of the cages and none of them were empty then....
    return "Your zoo is already at capacity!"
  end

  def visit 
    final_output = ""
    @employees.each do |employee|
      final_output += "#{employee.greet}\n"
    end

    @cages.each do |cage|
      if !cage.empty?
        final_output += "#{cage.animal.speak}\n"
      end
    end

    final_output
  end

end
