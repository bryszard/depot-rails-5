require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  fixtures :carts

  setup do
    @cart = carts(:one)
  end

  test 'adds one product' do
    new_line_item = @cart.add_product(products(:rspec))

    assert_equal 'Testing with RSpec', new_line_item.product.title
    assert_equal @cart, new_line_item.cart
  end

  test 'adds two different products' do
    assert_difference 'LineItem.count', 2 do
      first_item = @cart.add_product(products(:rspec))
      first_item.save
      second_item = @cart.add_product(products(:ruby))
      second_item.save
    end
  end

  test 'adds two same products' do
    assert_difference 'LineItem.count', 1 do
      first_item = @cart.add_product(products(:rspec))
      first_item.save
      second_item = @cart.add_product(products(:rspec))
      second_item.save
    end

    assert_equal 2, @cart.line_items.last.quantity
  end
end
