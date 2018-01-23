class Item < ActiveRecord::Base
    belongs_to :cart
    belongs_to :category
    has_many :line_items

    def self.available_items
        all_items = self.all
        all_items.select {|item| item.inventory > 0}
    end
end
