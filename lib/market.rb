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

  def sorted_item_list
    @vendors.map{|vendor| vendor.inventory.keys.map{|item| item.name}}.flatten.uniq.sort
  end

  def total_inventory
    total_inventory_hash = {}

    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if total_inventory_hash[item]
          total_inventory_hash[item][:quantity] += quantity
          total_inventory_hash[item][:vendors] << vendor
        else
          total_inventory_hash[item] = {quantity: quantity, vendors: [vendor]}
        end
      end
    end
    total_inventory_hash
  end

  def overstocked_items
    over_stocked = []
    total_inventory.each do |item, info|
      quantity = info[:quantity]
      vendors = info[:vendors]

      if vendors.length > 1 && quantity > 50
        over_stocked << item
      end
    end
    over_stocked
  end
end