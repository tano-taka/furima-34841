class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :order_id  


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city 
    validates :addresses 
    validates :phone_number, format: { with: /\A[0-9０-９]+\z/, message: 'Input only number'}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end