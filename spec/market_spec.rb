require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before :each do
    @market = Market.new("South Pearl Street Farmers Market")   
  end
  describe "#initialize" do
    expect(@market).to be_a Market
  end
end