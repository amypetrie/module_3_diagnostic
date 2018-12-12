class Station

  attr_reader :name

  def initialize(data)
    @name = data["station_name"]
  end

end
