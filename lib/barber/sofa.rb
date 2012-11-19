module Barber
  class Sofa
    attr_reader :free_place

    COUNT_PLACE = 4

    def initialize
      @freeze_place = false
      @freeze_mutex = Mutex.new
      @free_place = COUNT_PLACE

      @freeze_mutex = Mutex.new
    end

    def count_place
      COUNT_PLACE
    end

    def freeze_place
      if has_free_place?
        @freeze_place = true
        return self
      else
        return false
      end
    end

    def sit(visitor)
      @free_place -= 1
      @freeze_place = false

      @freeze_mutex.synchronize do
        @free_place += 1
      end

    end

    def has_free_place?
      !@freeze_place && !free_place.zero?
    end

  end
end

