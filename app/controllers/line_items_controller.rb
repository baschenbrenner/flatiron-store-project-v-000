class LineItemsController < ApplicationController
    
    
    def create
        if current_user.carts != []
            if Order.find_by(cart_id: current_user.carts.last.id)
            @cart = Cart.create(user_id: current_user.id)
            
           
            else
            @cart = current_user.carts.last
           
            end
        
        else
            @cart = Cart.create(user_id: current_user.id)
           
        end
            @cart.add_item(params[:item_id]).save
            current_user.current_cart_id = @cart.id
            current_user.save
        redirect_to cart_path(@cart)
               
            
    end
    
    
    
    private
    
  
end
