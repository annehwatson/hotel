require_relative "spec_helper"

describe "Reservation" do
  describe "Initializer" do
    it "creates an instance of Reservation" do
      reservation_data = {
        start_date: Date.parse("2016-10-10"),
        end_date: Date.parse("2016-10-12"),
        cost_per_night: 200.00
      }
      reservation = Hotel::Reservation.new(reservation_data)
      reservation.must_be_kind_of(Hotel::Reservation)
    end

    it "raises an ArgumentError if the end_date is before start_date" do
      reservation_data = {
        start_date: "2016-10-12",
        end_date: "2016-10-10",
        cost_per_night: 200.00
      }
      proc {
        reservation = Hotel::Reservation.new(reservation_data)
      }.must_raise(ArgumentError)
    end
  end

  describe "calculate_stay_duration" do
    it "accurately returns the number of days of the stay" do
      reservation_data = {
        start_date: Date.parse("2016-10-10"),
        end_date: Date.parse("2016-10-12"),
        cost_per_night: 200.00
      }
      reservation = Hotel::Reservation.new(reservation_data)
      reservation.calculate_stay_duration.must_equal(2)
    end
  end

  describe "total_cost" do
    it "accurately returns the total cost of a reservation" do
      reservation_data = {
        start_date: Date.parse("2016-10-10"),
        end_date: Date.parse("2016-10-12"),
        cost_per_night: 200.00
      }
      reservation = Hotel::Reservation.new(reservation_data)
      reservation.total_cost.must_equal(400.00)
    end
  end
end
