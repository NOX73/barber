require "barber/version"
require "semaphore"

module Barber
  autoload :Visitor, 'barber/visitor'
  autoload :Room, 'barber/room'
  autoload :Sofa, 'barber/sofa'
  autoload :Barber, 'barber/barber'
  autoload :Cashier, 'barber/cashier'
end