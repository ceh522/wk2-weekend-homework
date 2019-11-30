require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar.rb')


class Karaoke_BarTest < MiniTest::Test

  def setup

  end
