require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../disco_glasses.rb')


class Disco_GlassesTest < MiniTest::Test

  def setup

  end
