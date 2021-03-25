class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price_before_type_cast, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
    validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
