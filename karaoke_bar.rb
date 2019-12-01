class Karaoke_Bar

  attr_reader :name, :songs_available, :rooms

  def initialize(name, songs_available, rooms)
    @name = name
    @songs_available = songs_available
    @rooms = rooms
  end

end
