require_relative 'spec_helper'

describe "FrontDesk class" do
  describe "Initializer" do
    it "is an instance of FrontDesk" do
      front_desk = Hotel::FrontDesk.new
      front_desk.must_be_kind_of(Hotel::FrontDesk)
    end
  end

  describe "print_room_list" do
    it "returns a list of all the rooms in the hotel" do
      front_desk = Hotel::FrontDesk.new
      front_desk.rooms
    end
  end

  describe "reserve_room" do
    it "can reserve a room for a given date range" do
      front_desk = Hotel::FrontDesk.new
      result = front_desk.reserve_room("2020-10-12", "2020-10-13")
      front_desk.reservations.length.must_equal(1)
      result.start_date.must_be_instance_of(Date)
      result.end_date.must_be_instance_of(Date)
    end
  end

  describe "view_reservations_list(date)" do
    it "returns a list of reservations for a specific date" do

    end
  end

  describe "total_cost" do
    it "accurately returns the total cost of a specified reservation" do
      front_desk = Hotel::FrontDesk.new
      my_reservation = front_desk.reserve_room("2017-08-01", "2017-08-02")
      my_reservation.total_cost.must_equal(200.00)
    end
  end


end
