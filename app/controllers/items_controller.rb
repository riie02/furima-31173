class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :ensure_correct_user,only: [:edit, :update]
  before_action :set_item,only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path(@item.id)
    else
      render :edit
    end
  end

  def ensure_correct_user
    if current_user.id !=  params[:id].to_i
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_burden_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
