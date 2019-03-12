class Oystercard
  attr_reader :balance, :entry_station, :journey_list, :exit_station
  DEFAULT_LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_list = []
  end

  def top_up(amount)
    raise "Top-up exceeds £#{DEFAULT_LIMIT} balance limit. Add lower amount." if @balance + amount > DEFAULT_LIMIT

    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM
    @entry_station = entry_station
    in_journey?
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    @journey_list << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
    in_journey?
    deduct(MINIMUM)
  end

  def in_journey?
    if @entry_station == nil
      false
    else
      true
    end
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
