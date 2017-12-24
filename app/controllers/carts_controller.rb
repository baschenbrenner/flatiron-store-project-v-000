class CartsController < ApplicationController
    def show
        @order = Order.find_by(cart_id: params[:id])
    end
    
    def checkout
        @user = current_user
        @cart = @user.current_cart
        
        @cart.line_items.each do |line_item|
        
            @item = Item.find(line_item.item_id)
            @item.inventory = @item.inventory - line_item.quantity
            @item.save
        end
        
        @order = Order.create(cart_id: @cart.id, user_id: @user.id, status: "submitted")
        
        redirect_to cart_path(@cart)
    end
    
end
