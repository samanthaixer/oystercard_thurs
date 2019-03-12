class Oystercard
  attr_reader :balance, :station
  DEFAULT_LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @in_use = false
    @station = nil
  end

  def top_up(amount)
    raise "Top-up exceeds £#{DEFAULT_LIMIT} balance limit. Add lower amount." if @balance + amount > DEFAULT_LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM

    @in_use = true
    @station = station
  end

  def touch_out
    @in_use = false

    deduct(MINIMUM)
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
