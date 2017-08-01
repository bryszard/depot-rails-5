class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :order, optional: true
  belongs_to :product, optional: true

  def total_price
    price * quantity
  end
end
