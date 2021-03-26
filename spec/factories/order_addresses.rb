FactoryBot.define do
  factory :order_address do
    postal_code       { '123-4567' }
    prefecture_id     { rand(2..48) }
    city              { '横浜市' }
    addresses         { '1-1' }
    building_name     { 'greenハイツ横浜' }
    phone_number      { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
