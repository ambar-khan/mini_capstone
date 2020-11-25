class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
  
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id], 
      quantity: params[:quantity],
      status: "carted"
    ) 
    render "show.json.jb"
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end
end
