require 'test_helper'

class BarberTest < MiniTest::Unit::TestCase

  def test_should_emulate_barber
    50.times do
      Barber::Visitor.new
    end
  end

end
