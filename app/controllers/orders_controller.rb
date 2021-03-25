class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(order_id: @order.id)
  end
end