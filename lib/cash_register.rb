class CashRegister
  attr_accessor :total, :price, :discount, :items
  attr_reader :title, :quantity, :all

  @@all = []
  def initialize(discount = false)
    @total = 0
    @discount = discount
    @items = []
    @@all << self
  end

  def total
    @total
  end

  def self.all
    @@all
  end

  def add_item(title, price, quantity=1)
    @total = @total + (price * quantity)
    quantity.times do
    @items << title
    end
  end

  def apply_discount
    if self.discount
      @total = @total - (@total * discount/100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @@all[-1].total
  end
end
