class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def guest_can_remove_money_from_wallet(money)
    if @wallet >= money
      return @wallet -= money
      @till += money
    end
    return "Sorry, your payment has been declined"
  end


  # def check_if_guests_favourite_song_on_playlist(room, guest)
  #   playlist = room.songs_in_room
  #   songs_in_playlist = playlist.find { |song| [] == guest.favourite_song }
  #   if songs_in_playlist.include(guest.favourite_song)
  #     return "Whoo!"
  #   end
  # end




  end
