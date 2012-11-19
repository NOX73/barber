module Barber
  class Visitor
    attr_reader :cash

    def initialize(params)
      @cash = params[:cash]
    end

  end
end

