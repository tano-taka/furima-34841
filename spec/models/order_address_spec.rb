require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id )
    sleep 0.1
  end

  describe '商品購入フォームの入力' do
    context '商品購入がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名が空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '郵便番号が空だと登録できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号のハイフンがないと登録できないこと' do
        @order.postal_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号は数字でないと登録できないこと' do
        @order.postal_code = 'テスト-テストテ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県を選択しないと登録できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空だと登録できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できないこと' do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと登録できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数字のみでないと登録できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号は英数混合では登録できないこと' do
        @order.phone_number = 'abc12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号は11桁でないと登録できないこと' do
        @order.phone_number = '0901234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが発生しないと登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
