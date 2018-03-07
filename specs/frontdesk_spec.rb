require_relative 'spec_helper'

describe "FrontDesk class" do
  describe "Initializer" do
    it "is an instance of FrontDesk" do
      front_desk = Hotel::FrontDesk.new
      front_desk.must_be_kind_of(Hotel::FrontDesk)
    end
  end

  describe "first_available_room" do
    it "returns the first element from the room_numbers array that is not reserved for the specified date range" do
      front_desk = Hotel::FrontDesk.new
      result = front_desk.reserve_room("2020-10-12", "2020-10-13")
      assert front_desk.first_available_room("2020-10-12", "2020-10-13") != result.room
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

    it "does not assign a room that is not available for a specified date range" do
      front_desk = Hotel::FrontDesk.new
      reservation_one = front_desk.reserve_room("2020-10-12", "2020-10-13")
      reservation_two = front_desk.reserve_room("2020-10-12", "2020-10-13")
      assert reservation_one.room != reservation_two.room
    end
  end

  describe "view_reservations_list(date)" do
    it "returns a list of reservations for a specific date" do
      front_desk = Hotel::FrontDesk.new
      result = front_desk.reserve_room("2020-10-12", "2020-10-13")
      front_desk.view_reservations_list("2020-10-12").must_include(result)
    end

  end

  describe "view_available_rooms" do
    it "returns a list of rooms available for a specified date range" do
      front_desk = Hotel::FrontDesk.new
      reservation = front_desk.reserve_room("2020-10-12", "2020-10-13")
      available_rooms = front_desk.view_available_rooms("2020-10-12", "2020-10-13")
      assert !available_rooms.include?(reservation.room)
      available_rooms.length.must_equal(front_desk.NUMBER_OF_ROOMS - 1)
      available_rooms.must_be_instance_of(Array)
    end

    it "returns the complete list of rooms if there are no reservations" do
      front_desk = Hotel::FrontDesk.new
      front_desk.room_numbers.length.must_equal(front_desk.NUMBER_OF_ROOMS)
      result = front_desk.view_available_rooms("2017-08-01", "2017-08-02")
      result.must_be_instance_of(Array)
      result.length.must_equal(front_desk.NUMBER_OF_ROOMS)
    end

    it "returns a list of rooms that is not affected by reservations that don't overlap the date specified" do

    end

    it "does not list the rooms that are not available for a specified date range" do

    end

    it "shows rooms that have reservations ending on the requested start date in the availability list" do

    end


  end


end
