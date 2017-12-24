class Item < ActiveRecord::Base

    belongs_to :category
    has_many :line_items
    has_many :carts, through: :line_items
    has_many :orders, through: :cart


    def self.available_items
        Item.where("inventory > '0'")
    end
    

end

