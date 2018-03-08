require "Date"

require_relative "reservation"

module Hotel
  class FrontDesk
    attr_accessor :rooms, :reservations, :start_date, :end_date, :room_numbers
    attr_reader :NUMBER_OF_ROOMS

    def initialize
      @NUMBER_OF_ROOMS = 20
      @room_numbers = []
      idx = 0
      @NUMBER_OF_ROOMS.times do |idx|
        @room_numbers << (idx + 1)
      end
      @reservations = []
    end

    def view_available_rooms(start_date, end_date)

      @reservations.each do |reservation|
        if @room_numbers.include?(reservation.room) && (reservation.date_range.include?(Date.parse(start_date)) || reservation.date_range.include?(Date.parse(end_date)))
          @room_numbers.delete(reservation.room)
        end
      end
      return @room_numbers
    end

    def overlap

    end

    def first_available_room(start_date, end_date)
      return view_available_rooms(start_date,end_date).first
    end

    def reserve_room(start_date, end_date, is_block =false)
      assigned_room = first_available_room(start_date, end_date)
      reservation_data = {
        room: assigned_room,
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
      date_query = Date.parse(date)
      reservations = @reservations.select{ |reservation| reservation.date_range.include?(date_query)}
      return reservations
    end

  end
end

# my_desk = Hotel::FrontDesk.new
# p my_desk.reserve_room("2017-08-01", "2017-08-02")
# p my_desk.reserve_room("2017-08-01", "2017-08-02")
# p my_desk.reserve_room("2017-08-01", "2017-08-02")
# p my_desk.reserve_room("2017-08-01", "2017-08-02")
# p my_desk.room_numbers
