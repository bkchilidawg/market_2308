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

    it "creates a new vendor with a name" do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "creates a new vendor inventory with an empty list of items" do
      expect(@vendor.inventory).to be_empty  
    end
  end

  describe "#check_stock" do
    it "checks how many items are in stock" do
      expect(@vendor.check_stock(@item1)).to eq(0) 
    end
  end
  describe "stock" do
    it "adds an item to the vendor's inventory" do
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)

      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)
      expect(@vendor.check_stock(@item2)).to eq(12)  
    end

    it "has 2 items in inventory" do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory.keys.length).to eq 2
    end
  end
end