class AddPriceToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :price, :decimal

    LineItem.all.each { |li| li.update(price: li.product.price) }
  end
end
