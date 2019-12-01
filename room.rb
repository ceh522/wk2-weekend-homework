class Room

  attr_reader :name, :entry_fee, :capacity, :songs_in_room, :guests_in_room, :till

  def initialize(name, entry_fee, capacity, songs_in_room, guests_in_room, till)
    @name = name
    @entry_fee = entry_fee
    @capacity = capacity
    @songs_in_room = songs_in_room
    @guests_in_room = guests_in_room
    @till = 0
  end

  def add_song_to_room(song)
    return @songs_in_room << song
  end

  def add_guest_to_room(guest)
    if @guests_in_room.length < @capacity
      return @guests_in_room << guest
      # @till += @entry_fee
    end
    return "Room full"
  end

  def checkout_guest_from_room(guest)
    return @guests_in_room.delete(guest)
  end


end
