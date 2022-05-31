require "pry"
class CashRegister
    # getter & setter macro
    attr_accessor :total, :discount, :items
    
    # initialize w/ $0 total & default 0% discount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = Array.new
    end

    # update total of self based on item and quantity
    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        last_item_added(title, price, quantity)
        quantity.times do 
            @items << title
        end
    end

    # change discount to a decimal (float) & apply unless it is 0%
    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= (self.total * (@discount.to_f/100)) unless @discount == 0
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def last_item_added(title, price, quantity)
        @last_price = price
        @last_title = title
        @last_quantity = quantity
    end

    def void_last_transaction
        self.total -= @last_price * @last_quantity
    end
end