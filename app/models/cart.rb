class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items
    
    belongs_to :order
    
    
    def total
        sub_total_array = self.line_items.map do |line_item|
            line_item.quantity * Item.find(line_item.item_id).price
        end
        sub_total_array.sum
    end
    
    
    def add_item(item_id)
        LineItem.create_or_update(self.id, item_id)
    end
    
end
