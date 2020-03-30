FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    phone { Faker::Number.number(digits: 10).to_s }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    role { 0 }
  end
end
