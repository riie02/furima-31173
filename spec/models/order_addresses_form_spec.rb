require 'rails_helper'

RSpec.describe OrderAddressesForm, type: :model do
  describe '#create' do
    before do
      @order_addresses_form = FactoryBot.build(:order_addresses_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_addresses_form).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_addresses_form.postal_code = nil
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_addresses_form.postal_code = '1234567'
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include('Postal code Postal code is invalid. Include hyphen(-)')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @order_addresses_form.prefecture_id = 0
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include
    end

    it 'cityが空だと保存できないこと' do
      @order_addresses_form.city = nil
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include("City can't be blank")
    end

    it 'street_addressが空だと保存できないこと' do
      @order_addresses_form.street_address = nil
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include("Street address can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @order_addresses_form.building_name = nil
      expect(@order_addresses_form).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @order_addresses_form.phone_number = nil
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberがハイフンがあると保存できないこと' do
      @order_addresses_form.phone_number = '090-1234-5678'
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include('Phone number Phone number Input only number')
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_addresses_form.phone_number = '090123456789'
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include('Phone number Phone number Input only number')
    end

    it 'tokenが空では登録できないこと' do
      @order_addresses_form.token = nil
      @order_addresses_form.valid?
      expect(@order_addresses_form.errors.full_messages).to include("Token can't be blank")
    end
  end
end
