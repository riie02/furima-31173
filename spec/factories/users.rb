FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'abcd12' }
    password_confirmation { password }
    family_name { '佐藤' }
    first_name { '花子' }
    family_name_kana { 'サトウ' }
    first_name_kana { 'ハナコ' }
    birth_day { Faker::Date.backward }
  end
end
