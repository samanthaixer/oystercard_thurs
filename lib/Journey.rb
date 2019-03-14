class Journey
  def initialize
    @entry_station = nil
    @exit_station = nil
    @in_use = false
  end

  def start(entry_station)
    @entry_station = entry_station
    @in_use = true
    self
  end

  def finish(exit_station)
    @exit_station = exit_station
    @in_use = false
    self
  end

  def in_journey?
    @in_use
  end
end
