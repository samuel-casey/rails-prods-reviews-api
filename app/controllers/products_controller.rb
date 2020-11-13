class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all
    # how to render status??
    render({status: 200, json: @products.to_json(include: :reviews)})
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
     # how to render status??
    render({status: 200, json: @product.to_json(include: :reviews)})
  end

  private

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price, :img)
    end
end
