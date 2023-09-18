class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names 
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    sells_item = []
    @vendors.each do |vendor|
      vendor.inventory.each do |inventory_item, quantity|
        if inventory_item == item
          sells_item << vendor
          break 
        end
      end
    sells_item.uniq
    end
    sells_item
  end

  def potential_revenue
    
  end
end