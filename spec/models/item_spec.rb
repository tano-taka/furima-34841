require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいく時' do
      it '全て入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかない時' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '名前がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明がないと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態を選択しないと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status Select')
      end
      it '配送料の負担を選択しないと登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status Select')
      end
      it '配送元の地域を選択しないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数を選択しないと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery Select')
      end
      it '金額を入力しないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '金額が半角数字でないと登録できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price before type cast Half-width number')
      end
      it '金額が300円未満では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '金額が9999999円を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userと紐づいてないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
