class StoreController < ApplicationController
  # before_action :authenticate_user!

  def index
    @categories = Category.all
    @items = Item.available_items
    # @user = current_user
    # @user = User.find(session[:user_id])
  end
end
