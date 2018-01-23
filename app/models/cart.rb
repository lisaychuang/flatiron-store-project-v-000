class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        @total = 0
        self.line_items.each do |i|
            @total += (i.quantity * i.item.price)
        end
        @total
    end

    def add_item(item_id)

        # find cart's line_items array
        # check if item_id is in the array
        # if found, increase this line_item's quantity
        # else, create a new line_item

        if line_item = self.line_items.find_by(item_id: item_id)
            line_item.quantity +=1
            line_item
        else
            line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
        end
    end
end