class Person
  attr_reader :name
  attr_accessor :accounts, :cash

  def initialize(name, cash_level)
    @name = name
    @cash = cash_level
    @accounts = {}
    # {The Golden Galleon => 1500, The Silver Sickle => 1000, The Bronze Knut => 500}
  end

end
