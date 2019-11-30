require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest.rb')


class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Tammy", 30, "Walk 500 Miles")
  end

  def test_get_name
    assert_equal("Tammy", @guest1.name)
  end

  def test_get_money
    assert_equal(30, @guest1.money)
  end

  def test_get_favourite_song
    assert_equal("Walk 500 Miles", @guest1.favourite_song)
  end




end
