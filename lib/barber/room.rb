module Barber
  class Room
    MAX_VISITORS = 20
    attr_reader :sofas, :barders, :cashiers

    def initialize(params)
      @sofas = []
      @barbers = []
      @cashiers = []

      params[:sofas].times do
        @sofas << Sofa.new
      end

      params[:barbers].times do
        @barbers << Barber.new
      end

      params[:cashiers].times do
        @cashiers << Cashier.new
      end

      @enter_semaphore = Semaphore.new(MAX_VISITORS)
      @sofas_semaphore = Semaphore.new(sofas_places)
      @sofas_mutex = Mutex.new
    end

    def try_to_enter(visitor)
      @enter_semaphore.synchronize do
        enter visitor
      end
    end

    def enter(visitor)
      @sofas_mutex.synchronize do
        sofa = false
        @sofas.cycle { |s|
          sofa = s.freeze_place
          break if sofa
        }
      end

      sofa.sit visitor
    end

    def sofas_places
      places = 0
      @sofas.each do |s|
        places += s.count_place
      end
      places
    end

  end
end

