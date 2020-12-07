require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できないこと' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeは半角のハイフンを含んだ形式でないと保存できないこと' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'post_codeは半角数字でないと保存できない' do
      @purchase_address.post_code = '１２３−４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'cityが全角ひらがな漢字でないと保存できないこと' do
      @purchase_address.city = 'momoti3-3'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンは含まれると保存できないこと' do
      @purchase_address.phone_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角数字でないと保存できないこと' do
      @purchase_address.phone_number = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
