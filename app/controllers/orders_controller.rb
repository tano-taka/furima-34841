class OrdersController < ApplicationController
  def index
    @address = Address.new
  end
end