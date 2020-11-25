FactoryBot.define do
  factory :item do
    name                  { 'flower' }
    description           { Faker::Lorem.sentence }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_status_id    { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }
    price                 { 600 }
    association :user
  end
end
