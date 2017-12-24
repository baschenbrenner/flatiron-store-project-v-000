module ApplicationHelper
    
    def current_cart
        @cart = current_user.carts.last
        # if Order.find_by(cart_id: @cart.id)
        #     @cart = nil
        # end
        # @cart
    end
    
    
end
