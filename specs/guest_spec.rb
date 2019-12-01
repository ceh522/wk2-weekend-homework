require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Tammy", 30, "Walk 500 Miles")
    @guest2 = Guest.new("Frank", 1, "Ballad of an easy rider")
  end

  def test_get_name
    assert_equal("Tammy", @guest1.name)
  end

  def test_get_wallet
    assert_equal(30, @guest1.wallet)
  end

  def test_get_favourite_song
    assert_equal("Walk 500 Miles", @guest1.favourite_song)
  end

  def test_guest_can_remove_money_from_wallet
    result = @guest1.guest_can_remove_money_from_wallet(5)
    assert_equal(25, @guest1.wallet)
  end

  def test_payment_declined_if_guest_does_not_have_enough_money
    assert_equal("Sorry, your payment has been declined", @guest2.guest_can_remove_money_from_wallet(4))
  end

  # def test_check_if_guests_favourite_song_on_playlist
  #   assert_equal("Whoo!", @room2.check_if_guests_favourite_song_on_playlist(@guest1))
  # end
  #
  # def test_guest_does_not_cheer_if_favourite_song_not_on_playlist
  #   assert_equal("", @room4.check_if_guests_favourite_song_on_playlist(@guest1))
  # end

end
