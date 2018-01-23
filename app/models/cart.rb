class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        items = self.items
        items.map{|item| item.price}.sum
    end

    def add_item(item_id)
        line_item = self.line_items.find_by(item_id: item_id, cart_id: self.id)
        if line_item
          line_item.quantity += 1
          line_item.save
        else
          line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
        end

        line_item
    end
end