class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :carts
    has_many :orders
    has_many :line_items, through: :cart
    
    def current_cart= (cart)
        if cart != nil
        self.carts << cart
        self.current_cart_id = cart.id
        self.save
        end
    end
    
    def current_cart
        if @cart = Cart.find_by(id: self.current_cart_id)
            if Order.find_by(cart_id: @cart.id)
                self.current_cart_id = nil
                self.save
                @cart = nil
            end
        end
        @cart
    end
    
    
end
