require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')
require_relative('../guest_bar.rb')
require_relative('../room.rb')
require_relative('../karaoke_bar.rb')

class Karaoke_BarTest < MiniTest::Test

  def setup
    @song1 = Song.new("Mamma Mia", "Abba")
    @song2 = Song.new("Walk 500 Miles", "The Proclaimers")
    @song3 = Song.new("Uptown Junk", "Mark Ronson ft Bruno Mars")
    @guest1 = Guest.new("Tammy", 30, "Walk 500 Miles")
    @room1 = Room.new("Room 1", 5, [@song1, @song2])
    @room2 = Room.new("Room 2", 5, [@song1, @song2])
    @karaoke_bar1 = Karaoke_Bar.new("The OO CodeClan Caraoke", [@song1, @song2, @song3], [@room1, @room2])
  end

def test_get_name
  assert_equal("The OO CodeClan Caraoke", @karaoke_bar1.name)
end

def test_get_songs_available
assert_equal([@song1, @song2, @song3], @karaoke_bar1.songs_available)
end

def test_get_rooms
  assert_equal([@room1, @room2], @karaoke_bar1.rooms)
end 
