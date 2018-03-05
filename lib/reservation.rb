# require 'Date'

module Hotel
  class Reservation
    attr_accessor :start_date, :end_date, :cost_per_night, :date_range

    def initialize(input)
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @cost_per_night = input[:cost_per_night]
      @date_range = [@start_date..@end_date]

      unless @end_time == nil || @start_time == nil
        if @end_time < @start_time
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

# reservation_data = {
#   start_date: Date.parse("2016-10-10"),
#   end_date: Date.parse("2016-10-12"),
#   cost_per_night: 200.00
# }
#
# my_reservation = Hotel::Reservation.new(reservation_data)
# p my_reservation.date_range
# p my_reservation.calculate_stay_duration
# p my_reservation.total_cost