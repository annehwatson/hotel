require 'Date'

module Hotel
  class Reservation
    attr_accessor :start_date, :end_date, :cost_per_night, :date_range, :room

    def initialize(input)
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @cost_per_night = input[:cost_per_night]
      @date_range = (@start_date)...(@end_date)
      @room = input[:room]

      unless @end_date == nil || @start_date == nil
        if @end_date < @start_date
          raise ArgumentError.new("Reservation end date cannot be before reservation start date")
        end
      end

    end

    def calculate_stay_duration
      return @end_date - @start_date
    end

    def total_cost
      total_cost = (@cost_per_night * calculate_stay_duration)
      return total_cost
    end
  end
end
