class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  
  def index
    @order_addresses_form = OrderAddressesForm.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_addresses_form = Order.new(order_params)
    if @order_params.valid?
      @order_params.save
      reddirect_to root_path
    else
      render 'orders/index'
    end
  end

  private

  def order_params
    params.require(:order_addresses_form).premit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end