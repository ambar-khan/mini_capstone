class Api::ProductsController < ApplicationController
  def index
    # @products = Product.all
  
    if params[:search]
      @products = Product.where("name ILIKE '%#{search_term}%'")
    else
      @products = Product.all
    end

    if params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    elsif params[:sort] == "price"
      @products = @products.order(price: :asc)
    else
     @products = @products.order(id: :asc)
    end

    @products = @products.order(id: :asc)
    render 'index.json.jb'
  end
#figure out discount
  # if params[:discount] == "true"
  #   @products = @products.where("price < 1000")
  # end

  def show
    @product = Product.find_by(id: params[:id])
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
    
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
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

  def destroy
    #find the product
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product removed"}
  end


end
