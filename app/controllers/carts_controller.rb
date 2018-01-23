class CartsController < ApplicationController
    def show
        @cart = current_user.current_cart
    end

    def checkout
        @cart = Cart.find params[:id]
        @cart.status = "submitted"

        @cart.line_items.each do |line_item|
            line_item.item.inventory -= line_item.quantity
            line_item.item.save
        end
        @cart.save

        redirect_to cart_path
    end
end
