class OrderAddressesForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A(0{1}\d{9,10})\z/, message: "Phone number Input only number" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
