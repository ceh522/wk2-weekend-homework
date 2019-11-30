require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')


class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Mamma Mia", "Abba")
  end

  def test_get_name
    assert_equal("Mamma Mia", @song1.name)
  end

  def test_get_artist
    assert_equal("Abba", @song1.artist)
  end





end
