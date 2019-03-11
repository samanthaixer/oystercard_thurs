class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey_status = false
  end

  def top_up(amount)
    raise "Top-up exceeds £#{DEFAULT_LIMIT} balance limit. Add lower amount." if @balance + amount > DEFAULT_LIMIT
      
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey_status = true
  end

  def touch_out
    @in_journey_status = false
  end

  def in_journey?
    @in_journey_status
  end
end
