module Barber
  class Sofa
    attr_reader :free_place

    COUNT_PLACE = 4

    def initialize
      @freeze_place = false
      @freeze_mutex = Mutex.new
      @free_place = COUNT_PLACE

      @sit_semaphore = Semaphore.new(COUNT_PLACE)
    end

    def count_place
      COUNT_PLACE
    end

    def freeze_place
      @freeze_mutex.synchronize do
        if has_free_place?
          @freeze_place = true
          return self
        else
          return false
        end
      end
    end

    def sit(visitor)
      @sit_semaphore.synchronize do
        @freeze_place = false
        @free_place -= 1
        @free_place += 1
      end
    end

    def has_free_place?
      !@freeze_place && !free_place.zero?
    end

  end
end

