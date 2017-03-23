FactoryGirl.define do
  factory :payment do
    date_of_payment { Faker::Date.backward(14)}
    payment_deadline { Date.now}
    student nil
  end
end
