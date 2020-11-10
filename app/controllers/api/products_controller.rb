class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end 

  def create
    #make new recipe
    @product = Product.new(
      name: params[:input_name], 
      price: params[:input_price], 
      image_url: params[:input_image_url], 
      description: params[:input_description]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    #find product
    @product = Product.find_by(id: params[:id])
    #modify it
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    #save it
    @product.save

    render 'show.json.jb'
  end
end
