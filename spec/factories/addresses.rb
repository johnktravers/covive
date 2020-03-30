FactoryBot.define do
  factory :home_address, class: 'Address' do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    user
  end

  factory :errand_address, class: 'Address' do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    errand
  end
end
