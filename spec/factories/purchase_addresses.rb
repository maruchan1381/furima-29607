FactoryBot.define do
  factory :purchase_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '福岡市早良区' }
    house_number   { '百道3-3' }
    building_name  { '百道タワー1001' }
    phone_number   { '09023456789' }
  end
end
