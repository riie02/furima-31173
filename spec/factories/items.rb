FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_burden_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 1200 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
