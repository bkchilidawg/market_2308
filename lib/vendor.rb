class Vendor
  attr_reader :name, :inventory 
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item].to_i 
  end
  def stock(item, amount)
    if @inventory.key?(item)
      @inventory[item] += amount
      else
        @inventory[item] = amount
    end
  end

  def potential_revenue
    revenue = 0

    inventory.each do |item, quantity|
      item_price = item.price.delete("$").to_f
      revenue += item_price * quantity
    end
    revenue
  end
end