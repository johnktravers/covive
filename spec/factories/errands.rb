FactoryBot.define do
  factory :errand do
    name { 'Grocery Run' }
    category { 0 }
    urgency { 0 }
    notes { 'I need eggs, milk, and cinnamon. Thanks' }
    completed? { false }
    user
  end
end
