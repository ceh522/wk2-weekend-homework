require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')
require_relative('../room.rb')


class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Mamma Mia", "Abba")
    @song2 = Song.new("Walk 500 Miles", "The Proclaimers")
    @room1 = Room.new("Room 1", 5, [@song1, @song2])
  end


  def test_get_name
    assert_equal("Room 1", @room1.name)
  end

  def test_get_entry_fee
    assert_equal(5, @room1.entry_fee)
  end

  def test_get_songs_in_room
    assert_equal([@song1, @song2], @room1.songs_in_room)
  end



end
