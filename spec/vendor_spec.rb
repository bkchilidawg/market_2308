require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end
  describe "#initialize" do
    it "creates a new vendor" do
      expect(@vendor).to be_a Vendor  
    end
  end
end