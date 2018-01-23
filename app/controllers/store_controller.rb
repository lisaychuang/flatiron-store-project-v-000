class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    # @user = User.find(session[:user_id])
  end
end
