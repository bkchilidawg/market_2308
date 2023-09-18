require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before :each do

    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")  
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor1.stock(@item1, 35) 
    @vendor1.stock(@item2, 7)    
    @vendor2.stock(@item4, 50) 
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)  
    @market = Market.new("South Pearl Street Farmers Market")
  end

  describe "#initialize" do
    it 'creates a new market' do
      expect(@market).to be_a Market
    end

    it 'creates a new market with a name and vendors list' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors).to eq([])
    end
  end

  describe "#add_vendor" do
    it 'adds a vendor' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors.length).to eq 3
      expect(@market.vendors.first).to be_a Vendor  
    end
  end

  describe "#vendor_names" do
    it 'returns vendor names' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  
  describe "#vendors_that_sell" do
    it 'returns vendors that sell' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1).length).to eq 2
      expect(@market.vendors_that_sell(@item4).length).to eq 1 
    end
  end

  describe "#sorted_item_list" do
    it 'returns a list of items sorted alphabetically' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expected_item_names = [@item1.name, @item2.name, @item3.name, @item4.name].sort

      expect(@market.sorted_item_list).to eq(expected_item_names)  
    end
  end
end