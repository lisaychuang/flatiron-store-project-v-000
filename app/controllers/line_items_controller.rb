class LineItemsController < ApplicationController
    def create
        # check if there is a current_cart
        # if not, create a cart
        @cart = current_user.current_cart
        if @cart.nil?
            @cart = current_user.carts.create
        end
        current_user.current_cart = @cart

        add_line_item = @cart.add_item(params[:item_id])
        add_line_item.save     
        current_user.save

        redirect_to cart_path(@cart)
    end
end
