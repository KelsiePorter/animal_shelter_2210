class Shelter
  attr_reader :name,
              :capacity,
              :pets

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @pets = []
  end

  
end
