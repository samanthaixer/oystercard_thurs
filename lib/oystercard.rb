# require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journey_list, :exit_station
  DEFAULT_LIMIT = 90
  MINIMUM = 1

  def initialize(journey = Journey)
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_list = []
    @journey = journey
  end

  def top_up(amount)
    raise "Top-up exceeds £#{DEFAULT_LIMIT} balance limit. Add lower amount." if @balance + amount > DEFAULT_LIMIT

    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM
    j = @journey.new
    j.start(entry_station)
    p j
    add(j)
    # add(@journey.new.start(entry_station))
  end

  def touch_out(exit_station)
    # @exit_station = exit_station
    # add_journey
    # @entry_station = nil
    p @journey_list
    @journey_list.each do |journey|
      if journey.in_journey? == true
        journey.finish(exit_station)
      end
    end

    deduct(MINIMUM)
  end

  # def in_journey?
  #   @entry_station == nil ? false : true
  # end

  private

  def add(journey)
    @journey_list << journey
  end

  def deduct(amount)
    @balance -= amount
  end

end
