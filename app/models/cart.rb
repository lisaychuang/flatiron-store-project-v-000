class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        self.items.sum(:price)
    end

    def add_item(item_id)

        # find cart's line_items array
        # check if item_id is in the array
        # if found, increase this line_item's quantity
        # else, create a new line_item

        line_item = self.line_items.find_by(item_id: item_id)

        if line_item
            line_item.quantity +=1
            line_item.save
        else
            line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
        end

        line_item
    end
end