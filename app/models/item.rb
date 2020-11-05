class Item < ApplicationRecord
  belongs_t :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :shipping_area
  belongs_to :shipping_day

  #with_options presence: true do
    #validates :name,       
    #validates :description,
    #validates :category_id
    #validates :condition_id
    #validates :shipping_burden_id
    #validates :shipping_area_id
    #validates :shipping_day_id
    #validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9,999,999}, format: {with: /\A[0-9]+\z/}
    #validates :category
  #end

end
