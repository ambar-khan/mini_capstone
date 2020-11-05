class Api::ProductsController < ApplicationController
  def first_product
    @first_product = Product.first
    render "first_product.json.jb"
  end
end
