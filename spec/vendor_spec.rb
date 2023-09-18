require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before :each do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")  
    @vendor3 = Vendor.new("Palisade Peach Shack")
     
  end

  describe "#initialize" do
    it "creates a new vendor" do
      expect(@vendor1).to be_a Vendor  
    end

    it "creates a new vendor with a name" do
      expect(@vendor1.name).to eq("Rocky Mountain Fresh")
    end

    it "creates a new vendor inventory with an empty list of items" do
      expect(@vendor1.inventory).to be_empty  
    end
  end

  describe "#check_stock" do
    it "checks how many items are in stock" do
      expect(@vendor1.check_stock(@item1)).to eq(0) 
    end
  end
  describe "stock" do
    it "adds an item to the vendor's inventory" do
      @vendor1.stock(@item1, 30)
      expect(@vendor1.check_stock(@item1)).to eq(30)

      @vendor1.stock(@item1, 25)
      expect(@vendor1.check_stock(@item1)).to eq(55)

      @vendor1.stock(@item2, 12)
      expect(@vendor1.check_stock(@item2)).to eq(12)  
    end

    it "has 2 items in inventory" do
      @vendor1.stock(@item1, 30)
      @vendor1.stock(@item1, 25)
      @vendor1.stock(@item2, 12)
      expect(@vendor1.inventory.keys.length).to eq 2
    end
  end

  describe "#potential_revenue" do
    it 'returns potential revenue of a vendor' do
      @vendor1.stock(@item1, 35) 
      @vendor1.stock(@item2, 7)    
      @vendor2.stock(@item4, 50) 
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65) 
      expect(@vendor1.potential_revenue).to eq(29.75)
    end
  end
end