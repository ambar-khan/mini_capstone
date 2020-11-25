class Api::CartedProductsController < ApplicationController

  def create
    # product = Product.find_by(id: params[:product_id])
    
    @carted_product = CartedProduct.create(
      product_id: params[:product_id], 
      quantity: params[:quantity],
    ) 
    render "index.json.jb"
  end

end
