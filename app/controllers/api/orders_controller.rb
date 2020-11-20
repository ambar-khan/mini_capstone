class Api::OrdersController < ApplicationController

  def create
    @order = Order.new({user_id: 1, product_id: 5, quantity: 2})
    render 'show.json.jb'
  end

end
