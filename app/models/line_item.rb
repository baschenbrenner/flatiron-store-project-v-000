class LineItem < ActiveRecord::Base
    belongs_to :cart
    belongs_to :item
    
    
    def self.create_or_update(cart_id, item_id)
        if LineItem.find_by(cart_id: cart_id, item_id: item_id)
            @line_item = LineItem.find_by(cart_id: cart_id, item_id: item_id)
            @line_item.quantity += 1
            @line_item
        else
            LineItem.new(cart_id: cart_id, item_id: item_id, quantity: 1)
        end
    end    
            
end
