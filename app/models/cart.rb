class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        items = self.items
        items.map{|item| item.price}.sum
    end

    def add_item(item_id)
        # list all line_items in a cart
        # check if item_id is in this array
        line_items = self.line_items        
        find_item = line_items.select{|item| item.item_id == item_id}
        # if line_items contains an item with matching item_id 
            #update quantity of this item
        # else 
            # create a new line_item with item_id
        
        if find_item.length == 0
            self.line_items.new(item_id: item_id)
        else
            find_item.first
        end

    end
end