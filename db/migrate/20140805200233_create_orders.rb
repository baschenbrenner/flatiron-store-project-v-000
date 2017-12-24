class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
     
      t.integer :cart_id
      t.integer :user_id
      t.string :status
    end
    
  end
end
