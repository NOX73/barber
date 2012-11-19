require 'test_helper'

class BarberTest < MiniTest::Unit::TestCase

  def test_should_emulate_barber

    room = Barber::Room.new sofas: 1, barbers: 3, cashiers: 1

    Thread.abort_on_exception = true

    50.times do
      Thread.start do
        visitor = Barber::Visitor.new cash: 100
        room.try_to_enter visitor
      end
    end
    sleep 3
  end

end
