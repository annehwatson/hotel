require 'Date'

module Hotel
  class Reservation
    attr_accessor :start_date, :end_date

    def initialize(input)
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @cost_per_night = input[:cost_per_night]
    end
  end
end
