class Station

  attr_reader :name, :distance

  def initialize(data)
    @name = data["station_name"]
    @distance = data["distance"]
  end

end
