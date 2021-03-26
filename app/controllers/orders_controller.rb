class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :purchase_decision
  before_action :purchased

  def index
    @order_address = OrderAddress.new 
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path   
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )    
  end

  def purchase_decision
    redirect_to root_path if current_user.id == @item.user_id
  end

  def purchased
    redirect_to root_path unless @item.order.nil?
  end

end