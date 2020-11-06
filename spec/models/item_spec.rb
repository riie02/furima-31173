require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目に正しい入力が存在すれば保存できる' do
      expect(@item).to be_valid
    end

    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idが空だと登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'shipping_burden_idが空だと登録できない' do
      @item.shipping_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
    end

    it 'shipping_area_idが空だと登録できない' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'shipping_day_idが空だと登録できない' do
      @item.shipping_day_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it 'priceが空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が¥300~¥9,999,999の間でないと登録できない' do
      @item.price = "1000"
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '販売価格は半角数字でないと登録できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
