class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :purchased, only: [:index]
  
  def index
    @order_addresses_form = OrderAddressesForm.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_addresses_form = OrderAddressesForm.new(order_params)
    if @order_addresses_form.valid?
      pay_item
      @order_addresses_form.save
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private

  def order_params
    params.require(:order_addresses_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchased
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_82a224a7c25e56512200f5af"
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
    

end
