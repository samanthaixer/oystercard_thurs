require "oystercard"

describe Oystercard do
  before(:each) do
    @card = Oystercard.new
  end

  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up) }

  it "returns a starting balance of 0" do
    expect(@card.balance).to eq 0
  end

  it "should have a balance of 10 when user tops up 10" do
    @card.top_up(10)
    expect(@card.balance).to eq 10
  end

  it "increases balance by top up amount" do
    @card.top_up(10)
    @card.top_up(20)
    expect(@card.balance).to eq 30
  end

  it "allows top up to 1 below limit amount" do
    limit = Oystercard::DEFAULT_LIMIT
    expect(@card.top_up(limit - 1)).to eq limit - 1
  end

  it "has a default limit of £90" do
    limit = Oystercard::DEFAULT_LIMIT
    error = "Top-up exceeds £#{limit} balance limit. Add lower amount."
    @card.top_up(1)
    expect { @card.top_up(limit) }.to raise_error error
  end

  it { is_expected.to respond_to(:touch_in).with(1).argument }
  it { is_expected.to respond_to(:touch_out).with(1).argument }

  it "should have a minimum balance for a single journey" do
    expect { @card.touch_in("dummy") }.to raise_error "Insufficient funds"
  end

  it "should deduct the minimum fare when touched out" do
    subject.top_up(5)
    subject.touch_in("dummy")
    expect { subject.touch_out("dummy") }.to change{ subject.balance }.by(-1)
  end

  let (:entry_station) { double :station }
  let (:exit_station) { double :station }

  it "journey list should be an array"  do
    expect(subject.journey_list).to eq []
  end

  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }
  let(:card) { Oystercard.new(journey_class) }

  it 'stores a journey' do
    card.top_up(5)
    expect(journey).to receive(:start)
    expect(journey).to receive(:in_journey?).and_return(true)
    card.touch_in(entry_station)
    expect(journey).to receive(:finish)
    card.touch_out(exit_station)
    expect(card.journey_list).to include journey
  end
end
