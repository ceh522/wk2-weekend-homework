require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../disco_merchandise.rb')


class Disco_MerchandiseTest < MiniTest::Test

  def setup
    @disco_merchandise1= Disco_Merchandise.new("Disco Glasses", 4)
  end

  def test_get_name
    assert_equal("Disco Glasses", @disco_merchandise1.name)
  end

  def test_get_pricce
    assert_equal(4, @disco_merchandise1.price)
  end




end
