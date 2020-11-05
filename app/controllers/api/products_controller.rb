class Api::ProductsController < ApplicationController
  def first_product
    @first_product = Product.first
    render "first_product.json.jb"
  end

  def all 
    @all = Product.all
    render "all.json.jb"
  end
end
