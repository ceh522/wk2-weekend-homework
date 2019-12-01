require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../disco_merchandise')
require('pry-byebug')


class RoomTest < MiniTest::Test

  def setup
    @disco_merchandise1= Disco_Merchandise.new("Disco Glasses", 4)
    @song1 = Song.new("Mamma Mia", "Abba")
    @song2 = Song.new("I'm Gonna Be", "The Proclaimers")
    @song3 = Song.new("Uptown Funk", "Mark Ronson ft Bruno Mars")
    @song4 = Song.new("Ain't No Sunshine", "Bill Withers")
    @song5 = Song.new("Gloria", "Laura Branigan")
    @song6 = Song.new("Ballad of an Easy Rider", "The Byrds")
    @guest1 = Guest.new("Tammy", 30, @song2)
    @guest2 = Guest.new("Gary", 40, @song4)
    @guest3 = Guest.new("Emma", 30, @song5)
    @guest4 = Guest.new("Frank", 1, @song6)
    @room1 = Room.new("Room 1", 5, 6, [@song1, @song2], [], 0)
    @room2 = Room.new("Room 2", 5, 6, [@song1, @song2], [@guest1, @guest2], 0)
    @room3 = Room.new("Room 3", 5, 2, [@song1, @song2], [@guest1, @guest2], 0)
    @room4 = Room.new("Room 4", 5, 2, [@song1, @song3], [@guest1, @guest], 0)
  end


  def test_get_name
    assert_equal("Room 1", @room1.name)
  end

  def test_get_entry_fee
    assert_equal(5, @room1.entry_fee)
  end

  def test_get_room_capacity
    assert_equal(6, @room1.capacity)
  end

  def test_get_songs_in_room
    assert_equal([@song1, @song2], @room2.songs_in_room)
  end

  def test_get_balance_in_till
    assert_equal(0, @room2.till)
  end

  def test_add_song_to_room
    result = @room1.add_song_to_room(@song3)
    assert_equal([@song1, @song2, @song3], @room1.songs_in_room)
  end

  def test_get_guests_in_room
    assert_equal([@guest1, @guest2], @room2.guests_in_room)
  end

  def test_add_guest_to_room
    result = @room1.add_guest_to_room(@guest3)
    assert_equal([@guest3], @room1.guests_in_room)
  end

  def test_if_room_capacity_full_cannot_add_guests
    result = @room3.add_guest_to_room(@guest3)
    assert_equal("Room full", @room3.add_guest_to_room(@guest3))
    assert_equal([@guest1, @guest2], @room3.guests_in_room)
  end

  def test_checkout_guest_from_room
    result = @room2.checkout_guest_from_room(@guest1)
    assert_equal([@guest2], @room2.guests_in_room)
  end

  def test_guest_can_pay_entry_fee_for_room
    result = @guest3.guest_can_remove_money_from_wallet(@room1.entry_fee)
    assert_equal(25, @guest3.wallet)
  end

  def test_guest_cannot_check_into_room_if_does_not_have_enough_money
    result = @room3.add_guest_to_room(@guest4)
    assert_equal([@guest1, @guest2], @room3.guests_in_room)
  end

  def test_guest_can_buy_disco_merchandise
    assert_equal(26, @guest3.guest_can_remove_money_from_wallet(@disco_merchandise1.price))
  end

  def test_guest_cannot_buy_disco_merchandise_if_does_not_have_enough_money
    assert_equal("Sorry, your payment has been declined", @guest4.guest_can_remove_money_from_wallet(@disco_merchandise1.price))
  end

  # def test_till_balance
  #   @guest2.guest_can_remove_money_from_wallet(@room2.entry_fee)
  #   @guest1.guest_can_remove_money_from_wallet(@disco_merchandise1.price)
  #   assert_equal(9, @room2.till)
  # end

end
