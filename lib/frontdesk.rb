# require "Date"

require_relative "reservation"

module Hotel
  class FrontDesk
    attr_accessor :rooms, :reservations, :start_date, :end_date

    def initialize
      @rooms = [1..20] # possibly class Room instances
      @reservations = []
    end

    def reserve_room(start_date, end_date, is_block =false)
      reservation_data = {
        #room number,
        start_date: Date.parse(start_date),
        end_date: Date.parse(end_date),
        cost_per_night: unless is_block == true
                cost_per_night = 200.00
              else
                cost_per_night = 180.00
              end
      }

      reservation = Reservation.new(reservation_data)

      @reservations << reservation
      return reservation
    end

    def view_reservations_list(date)
      reservations = @reservations.select{ |reservation| reservation.date_range.include?(date)}
      puts "I am the view reservations list method: "
      return reservations
    end

  end
end

# my_desk = Hotel::FrontDesk.new
# my_desk.reserve_room("2017-08-01", "2017-08-02")
# my_desk.reserve_room("2017-09-01", "2017-09-02")
# p my_desk.view_reservations_list("2017-09-01")
