class AddFulfilledToItemOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :item_orders, :fulfilled?, :boolean
  end
end
