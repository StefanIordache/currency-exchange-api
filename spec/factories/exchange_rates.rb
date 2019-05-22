FactoryBot.define do
  factory :currency_exchange do
    from_currency { Faker::Currency.code }
    to_currency { Faker::Currency.code }
    exchange_rate { Faker::Number.decimal(2,2) }
    entry_date { Faker::Date.between(50.days.ago, Date.today) }
    created_by { Faker::Number.number(10) }
  end
end