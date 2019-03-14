require 'journey'
require 'oystercard'

describe Journey do
  let(:journey) { Journey.new }

  # it "should return false for in_journey when journey hasn't started" do
  #   expect(journey).to_not be_in_journey
  # end

  let(:entry_station) { double :station }

  it "should start a journey" do
    expect(journey.start(entry_station)).to eq journey
  end

  let(:exit_station) { double :station }
  before { journey.start(entry_station) }

  it "should finish the journey" do
    expect(journey.finish(exit_station)).to eq journey
  end

  it "should change in journey status to true when card touched in" do
    expect(journey).to be_in_journey
  end

  it "should should tell us whether the journey is complete" do
    journey.finish(exit_station)
    # expect(journey.in_journey?).to eq false
    expect(journey).to_not be_in_journey
  end


end
