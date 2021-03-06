require "Date"

require_relative "reservation"

module Hotel
  class FrontDesk
    attr_accessor :rooms, :reservations, :start_date, :end_date, :room_numbers
    attr_reader :number_of_rooms

    def initialize
      @number_of_rooms = 20
      @room_numbers = []
      idx = 0
      @number_of_rooms.times do |idx|
        @room_numbers << (idx + 1)
      end
      @reservations = []
    end

    def view_available_rooms(start_date, end_date)

      @reservations.each do |reservation|
        # if @room_numbers.include?(reservation.room) && (reservation.date_range.include?(Date.parse(start_date)) || reservation.date_range.include?(Date.parse(end_date)))
        #   @room_numbers.delete(reservation.room)
        overlapping_dates = (reservation.date_range.to_a) & (Date.parse(start_date)...Date.parse(end_date)).to_a

        if @room_numbers.include?(reservation.room) & !overlapping_dates.empty?
          @room_numbers.delete(reservation.room)
        end
      end
      return @room_numbers
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
