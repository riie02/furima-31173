class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_burden_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :image
    validates :price,
                :numericality => {
                  :greater_than_or_equal_to => 299,
                  :less_than_or_equal_to => 9999999,
                  :message => "Price Out of setting range"
                },
                :format  => { with: /\A[0-9]+\z/, messeges: "Price Half-width number"}
  end

  with_options numericality: { other_than: 1, messeage:"Select" } do
    validates :category_id
    validates :condition_id
    validates :shipping_burden_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
