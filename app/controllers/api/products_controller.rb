class Api::ProductsController < ApplicationController
  before_action :authenticate_user, only:  [:create, :update]
  
  def index
    p "current_user"
    p current_user
    p "/current_user"

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
  end

#figure out discount
  # if params[:discount] == "true"
  #   @products = @products.where("price < 1000")
  # end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
    p current_user
  end 

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    @product.save
    render "show.json.jb"
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
